# https://github.com/terraform-aws-modules/terraform-aws-acm/tree/v2.12.0

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.12.0"

  domain_name        = var.acm_domain_name
  create_certificate = true

  # The ID of the hosted zone to contain this record.
  zone_id = aws_route53_zone.private.zone_id

  subject_alternative_names = [
    "*.acm.trackit.boilerplate.internal",
    "app.sub.acm.trackit.boilerplate.internal"
  ]

  wait_for_validation = false

  tags = local.tags
}
