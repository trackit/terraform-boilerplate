# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone

/*
resource "aws_route53_zone" "primary_zone" {
  name = "www.example.com"

  tags = local.tags
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "www.example.com"
  type    = var.route53_type
  ttl     = var.route53_ttl
  records = var.route53_records
}
*/
