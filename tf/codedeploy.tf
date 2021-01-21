resource "aws_security_group" "http" {
  name   = "${var.codedeploy_ecs_app_name}-alb-allow-http"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_security_group" "https" {
  name   = "${var.codedeploy_ecs_app_name}-alb-allow-https"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_lb" "alb" {
  name               = "${var.codedeploy_ecs_app_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http.id, aws_security_group.https.id]
  subnets            = module.vpc.public_subnets

  tags = local.tags
}

locals {
  target_groups = [
    "green",
    "blue",
  ]
}

resource "aws_lb_target_group" "alb_target_groups" {
  count = length(local.target_groups)

  name = "${var.codedeploy_ecs_app_name}-alb-${element(local.target_groups, count.index)}"

  port        = var.codedeploy_ecs_container_port
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"

  health_check {
    path    = var.codedeploy_ecs_alb_healthcheck_route
    port    = var.codedeploy_ecs_container_port
    matcher = var.codedeploy_ecs_alb_healthcheck_matcher
  }

  tags = local.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_groups.*.arn[0]
  }

  lifecycle {
    ignore_changes = [default_action]
  }
}

resource "aws_lb_listener_rule" "http" {
  listener_arn = aws_lb_listener.http.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_groups.*.arn[0]
  }

  lifecycle {
    ignore_changes = [action]
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.codedeploy_ecs_alb_https_acm_cert_arn

  lifecycle {
    ignore_changes = [default_action]
  }

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_groups.*.arn[0]
  }
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = aws_lb_listener.https.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_groups.*.arn[0]
  }

  lifecycle {
    ignore_changes = [action]
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}

resource "aws_codedeploy_app" "codedeploy-ecs" {
  compute_platform = "ECS"
  name             = var.codedeploy_ecs_app_name
}

resource "aws_codedeploy_deployment_group" "codedeploy-ecs" {
  app_name               = aws_codedeploy_app.codedeploy-ecs.name
  deployment_group_name  = "${var.codedeploy_ecs_app_name}-deployment-group"
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"
  service_role_arn       = aws_iam_role.codedeploy.name

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action = "TERMINATE"
    }
  }

  ecs_service {
    cluster_name = aws_ecs_cluster.cluster.name
    service_name = aws_ecs_service.service.name
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [aws_lb_listener.http.arn, aws_lb_listener.https, arn]
      }

      ## Blue

      target_group {
        name = aws_lb_target_group.alb_target_groups.*.name[0]
      }

      ## Green

      target_group {
        name = aws_lb_target_group.alb_target_groups.*.name[1]
      }
    }
  }
}

## Role

data "aws_iam_policy_document" "assume_by_codedeploy" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codedeploy.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "codedeploy" {
  name               = "codedeploy-role"
  assume_role_policy = data.aws_iam_policy_document.assume_by_codedeploy.json
}

## Policy

data "aws_iam_policy_document" "codedeploy" {
  statement {
    sid    = "AllowLoadBalancingAndECSModifications"
    effect = "Allow"

    actions = [
      "ecs:CreateTaskSet",
      "ecs:DeleteTaskSet",
      "ecs:DescribeServices",
      "ecs:UpdateServicePrimaryTaskSet",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:DescribeRules",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:ModifyListener",
      "elasticloadbalancing:ModifyRule",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "AllowS3"
    effect = "Allow"

    actions = ["s3:GetObject"]

    resources = ["${var.codedeploy_ecs_s3_bucket_arn}/*"]
  }

  statement {
    sid    = "AllowPassRole"
    effect = "Allow"

    actions = ["iam:PassRole"]

    resources = [
      aws_iam_role.task_role,
      aws_iam_role.ecs_execution_role,
    ]
  }
}

## RolePolicy

resource "aws_iam_role_policy" "codedeploy" {
  role   = aws_iam_role.codedeploy.name
  policy = data.aws_iam_policy_document.codedeploy.json
}
