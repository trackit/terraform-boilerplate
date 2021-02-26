# https://github.com/terraform-aws-modules/terraform-aws-acm/tree/v2.12.0

resource "aws_acmpca_certificate_authority" "ca_authority" {
  certificate_authority_configuration {
    key_algorithm     = "RSA_4096"
    signing_algorithm = "SHA512WITHRSA"

    subject {
      common_name = "example.com"
    }
  }

  permanent_deletion_time_in_days = 7
}

resource "aws_acm_certificate" "cert" {
  certificate_authority_arn = aws_acmpca_certificate_authority.ca_authority.arn
  domain_name               = "trackit.boilerplate.internal"

  tags = local.tags
}
