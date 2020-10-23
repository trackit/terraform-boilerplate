# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/5.9.0

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.9.0"

  name = var.alb_name

  load_balancer_type = var.alb_load_balancer_type

  vpc_id          = module.vpc.default_vpc_id
  subnets         = module.vpc.private_subnets
  security_groups = [module.vpc.default_security_group_id]

  access_logs = {
    bucket = "my-alb-logs"
  }

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