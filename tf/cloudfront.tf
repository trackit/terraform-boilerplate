resource "aws_route53_zone" "private" {
  name = "trackit.boilerplate.internal"

  vpc {
    vpc_id = module.vpc.vpc_id
  }
}

# https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn/tree/0.44.0
module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.44.0"

  name = "tf-boilerplate-cloudfront-bucket"

  aliases        = ["assets.trackit.boilerplate.internal"]
  parent_zone_id = aws_route53_zone.private.zone_id

  tags = local.tags
}
