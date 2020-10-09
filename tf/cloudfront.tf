# https://registry.terraform.io/modules/terraform-aws-modules/cloudfront/aws/0.3.0

resource "aws_acm_certificate" "cert" {
  domain_name       = var.cdn_acm_domain_name
  validation_method = var.cdn_acm_method

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

module "cdn" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "0.3.0"

  aliases = var.cdn_aliases

  comment             = var.cdn_comment
  enabled             = var.cdn_enabled
  is_ipv6_enabled     = var.cdn_is_ipv6_enabled
  price_class         = var.cdn_price_class
  retain_on_delete    = var.cdn_retain_on_delete
  wait_for_deployment = var.cdn_wait_for_deployment

  create_origin_access_identity = var.cdn_create_origin_access_identity
  origin_access_identities      = var.cdn_origin_access_identities

  logging_config = var.cdn_logging_config

  origin = var.cdn_origin

  cache_behavior = var.cdn_cache_behavior

  viewer_certificate = {
    acm_certificate_arn = aws_acm_certificate.cert.arn
    ssl_support_method  = "sni-only"
  }

  tags = local.tags
}