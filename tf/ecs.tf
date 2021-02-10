resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_cluster_name

  tags = local.tags
}

# https://github.com/cloudposse/terraform-aws-ecs-container-definition/tree/0.44.0
module "ecs-container-definition" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.44.0"

  container_image = "${module.ecr.repository_url}:latest"
  container_name  = var.ecs_container_name

  environment = [{
    name  = "SNS_TOPIC_ARN"
    value = aws_sns_topic.sns_topic.arn
    }, {
    name  = "BUCKET_NAME"
    value = var.s3_name
  }]

  log_configuration = {
    logDriver = "awslogs"
    options = {
      "awslogs-group"         = "/ecs/${var.ecs_task_family}"
      "awslogs-region"        = var.region
      "awslogs-stream-prefix" = "ecs"
    }
  }

  container_memory = var.ecs_container_memory
  container_cpu    = var.ecs_task_cpu
}

resource "aws_ecs_task_definition" "task" {
  container_definitions = module.ecs-container-definition.json_map_encoded_list
  family                = var.ecs_task_family

  ## TaskRoleArn
  ## SecurityAudit - The one needed to be created (see: https://github.com/trackit/devops-project-management/issues/9)
  task_role_arn = aws_iam_role.task_role.arn

  ## ExecutionRoleArn
  ## ECR Access Role
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_container_memory

  tags = local.tags
}

resource "aws_ecs_service" "service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn

  #load_balancer {
  #  target_group_arn = aws_lb_target_group.alb_target_groups.*.arn[0]
  #  container_name   = var.container_name
  #  container_port   = var.container_port
  #}

  network_configuration {
    subnets          = module.vpc.private_subnets
    assign_public_ip = true
    security_groups  = [module.vpc.default_security_group_id]
  }
  launch_type = "FARGATE"

  tags = local.tags
}

resource "aws_cloudwatch_event_rule" "scheduled_task" {
  count = var.ecs_enable_scheduling ? 1 : 0
  name  = "ecs-service-rule"

  ## See https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions
  schedule_expression = var.ecs_schedule_expression
  is_enabled          = true
  tags                = local.tags
}

resource "aws_cloudwatch_event_target" "scheduled_task" {
  count     = var.ecs_enable_scheduling ? 1 : 0
  target_id = "ecs-service-target"
  rule      = aws_cloudwatch_event_rule.scheduled_task[0].name
  arn       = aws_ecs_cluster.cluster.arn
  role_arn  = aws_iam_role.scheduled_task_cloudwatch.arn

  ecs_target {
    task_count          = 1
    task_definition_arn = aws_ecs_task_definition.task.arn
    launch_type         = "FARGATE"
    network_configuration {
      subnets          = module.vpc.private_subnets
      assign_public_ip = true
      security_groups  = [module.vpc.default_security_group_id]
    }
  }
}

resource "aws_iam_role" "ecs_execution_role" {
  name = var.ecs_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_policy" "access_logs_policy" {
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ],
        Resource : [
          "*"
        ]
      }
    ]
  })
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name = "/ecs/${var.ecs_task_family}"

  tags = local.tags
}

resource "aws_iam_policy" "access_ecr_policy" {
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetAuthorizationToken",
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "access_logs_attached_policy" {
  policy_arn = aws_iam_policy.access_logs_policy.arn
  role       = aws_iam_role.ecs_execution_role.name
}

resource "aws_iam_role_policy_attachment" "access_logs_attached_toRole_policy" {
  policy_arn = aws_iam_policy.access_logs_policy.arn
  role       = aws_iam_role.task_role.name
}

resource "aws_iam_role_policy_attachment" "access_ecr_attached_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = aws_iam_policy.access_ecr_policy.arn
}

resource "aws_iam_role" "task_role" {
  name = var.ecs_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_policy" "task_role_policy" {
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:GetAccessPoint",
          "s3:PutAccountPublicAccessBlock",
          "s3:GetAccountPublicAccessBlock",
          "s3:ListAllMyBuckets",
          "s3:ListAccessPoints",
          "s3:ListJobs",
          "s3:CreateJob",
          "s3:PutObject"
        ],
        Resource = "*"
      },
      {
        Sid      = "VisualEditor1",
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.ecs_role_name}"
      },
      {
        Sid    = "VisualEditor2",
        Effect = "Allow",
        Action = "s3:*",
        Resource = [
          module.s3.this_s3_bucket_arn,
          "${module.s3.this_s3_bucket_arn}/*"
        ]
      },
      {
        Sid    = "VisualEditor3",
        Effect = "Allow",
        Action = [
          "SNS:Subscribe",
          "SNS:SetTopicAttributes",
          "SNS:RemovePermission",
          "SNS:Receive",
          "SNS:Publish",
          "SNS:ListSubscriptionsByTopic",
          "SNS:GetTopicAttributes",
          "SNS:DeleteTopic",
          "SNS:AddPermission",
        ],
        Resource = [
          aws_sns_topic.sns_topic.arn,
          "${aws_sns_topic.sns_topic.arn}/*",
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attached_policy" {
  role       = aws_iam_role.task_role.name
  policy_arn = aws_iam_policy.task_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "task_role_attached_policy" {
  count      = length(var.ecs_task_role_policies)
  policy_arn = var.ecs_task_role_policies[count.index]
  role       = aws_iam_role.task_role.name
}

resource "aws_iam_role_policy_attachment" "execution_role_attached_policy" {
  count      = length(var.ecs_execution_role_policies)
  policy_arn = var.ecs_execution_role_policies[count.index]
  role       = aws_iam_role.ecs_execution_role.name
}

# AWS IAM Role and Policy for cloudwatch
resource "aws_iam_role" "scheduled_task_cloudwatch" {
  name = "ecs-cloudwatch-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "events.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy" "scheduled_task_cloudwatch_policy" {
  name = "ecs-cloudwatch-policy"
  role = aws_iam_role.scheduled_task_cloudwatch.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ecs:RunTask"
        ],
        Resource = [
          replace(aws_ecs_task_definition.task.arn, "/:\\d+$/", ":*")
        ]
      },
      {
        Effect = "Allow",
        Action = "iam:PassRole",
        Resource = [
          "*"
        ]
      }
    ]
  })
}
