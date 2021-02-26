resource "aws_acmpca_certificate_authority" "ca_authority" {
  certificate_authority_configuration {
    key_algorithm     = "RSA_4096"
    signing_algorithm = "SHA512WITHRSA"

    subject {
      common_name = "trackit.boilerplate.internal"
    }
  }

  permanent_deletion_time_in_days = 7

  tags = local.tags
}

resource "aws_acm_certificate" "cert" {

  # Only used for private certificate
  certificate_authority_arn = aws_acmpca_certificate_authority.ca_authority.arn

  # Only used for ACM cert with route53 public hosted zone
  # validation_method = "DNS"

  domain_name = "trackit.boilerplate.internal"

  tags = local.tags
}
