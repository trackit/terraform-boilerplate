resource "aws_route53_zone" "primary_zone" {
  name = var.route53_zone_name

  tags = {
    Terraform          = "true"
    Environment        = var.env
    TerraformWorkspace = terraform.workspace
  }
}

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.primary_zone.zone_id
  name    = var.route53_record_name
  type    = var.route53_type
  ttl     = var.route53_ttl
  records = var.route53_records
}
