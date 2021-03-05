# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/5.9.0

resource "aws_security_group" "alb_security_group" {
  name        = "alb-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.9.0"

  name = var.alb_name

  load_balancer_type = var.alb_load_balancer_type

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  security_groups = [aws_security_group.alb_security_group.id]

  #access_logs = {
  #  bucket = "my-alb-logs"
  #}

  # A list of maps containing key/value pairs that define the target groups to be created.
  # Order of these maps is important and the index of these are to be referenced in listener definitions.
  # Required key/values: name, backend_protocol, backend_port
  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  # A list of maps describing the HTTPS listeners for this ALB.
  # Required key/values: port, certificate_arn.
  # Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08),
  # target_group_index (defaults to https_listeners[count.index])
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = aws_acm_certificate_validation.acm_validation.certificate_arn
      target_group_index = 0
    }
  ]

  # A list of maps describing the HTTP listeners or TCP ports for this ALB.
  # Required key/values: port, protocol.
  # Optional key/values: target_group_index (defaults to http_tcp_listeners[count.index])
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = local.tags
}

data "aws_route53_zone" "selected" {
  name         = "trackit.io"
  private_zone = false
}

resource "aws_route53_record" "acm_record" {
  for_each = {
    for dvo in aws_acm_certificate.public_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.selected.zone_id
}

resource "aws_acm_certificate_validation" "acm_validation" {
  certificate_arn         = aws_acm_certificate.public_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_record : record.fqdn]
}
