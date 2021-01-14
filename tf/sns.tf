# https://registry.terraform.io/modules/terraform-aws-modules/sns/aws/2.1.0

resource "aws_sns_topic" "sns_topic" {
  name = var.sns_name
  tags = local.tags
}
