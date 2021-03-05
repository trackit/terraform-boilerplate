resource "aws_acm_certificate" "public_cert" {


  # Only used for ACM cert with route53 public hosted zone
  validation_method = "DNS"

  domain_name = var.acm_domain_name

  tags = local.tags
}
