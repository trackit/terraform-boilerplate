# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/5.9.0

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.9.0"

  name = var.alb_name

  load_balancer_type = var.alb_load_balancer_type

  vpc_id          = module.vpc.default_vpc_id
  subnets         = module.vpc.private_subnets
  security_groups = [module.vpc.default_security_group_id]

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
      certificate_arn    = aws_acm_certificate.cert.arn
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

resource "aws_acm_certificate" "cert" {
  private_key      = tls_private_key.example_key.private_key_pem
  certificate_body = tls_self_signed_cert.example_cert.cert_pem
}

resource "tls_private_key" "example_key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "tls_self_signed_cert" "example_cert" {
  key_algorithm   = "ECDSA"
  private_key_pem = tls_private_key.example_key.private_key_pem

  subject {
    common_name  = "example.com"
    organization = "ACME Examples, Inc"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}