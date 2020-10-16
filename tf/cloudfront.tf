# https://registry.terraform.io/modules/terraform-aws-modules/cloudfront/aws/1.1.0

module "cdn" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "1.1.0"

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

  # One or more origins for this distribution (multiples allowed).
  origin = {
    something = {
      domain_name = "something.example.com"
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "match-viewer"
        origin_ssl_protocols = [
          "TLSv1"
        ]
      }
    }
  }

  # The map of cache behaviors for this distribution.
  # Key default will be used as the default cache behavior, all other keys will be used as ordered list of cache behaviors.
  # List from top to bottom in order of precedence.
  # The topmost cache behavior will have precedence 0.
  cache_behavior = {
    target_origin_id       = "something"
    viewer_protocol_policy = "allow-all"

    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS"
    ]
    cached_methods = [
      "GET",
      "HEAD"
    ]
    compress     = true
    query_string = true
  }
}

  viewer_certificate = {
    acm_certificate_arn = aws_acm_certificate.cert.arn
    ssl_support_method  = "sni-only"
  }

  tags = local.tags
}

resource "aws_acm_certificate" "cert" {
  domain_name       = var.cdn_acm_domain_name
  validation_method = var.cdn_acm_method

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}
