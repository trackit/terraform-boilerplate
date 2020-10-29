# https://github.com/terraform-aws-modules/terraform-aws-acm/tree/v2.11.0

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.11.0"


  domain_name        = var.acm_domain_name
  create_certificate = var.acm_create_cert
  # The ID of the hosted zone to contain this record.
  zone_id                   = "Z2ES7B9AZ6SHAE"
  subject_alternative_names = var.acm_subject_alternative_names

  tags = local.tags
}
