# https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn/tree/0.44.0


resource "aws_s3_bucket" "b" {
  bucket = "terraform-boilerplate-cdn"

  acl           = "private"
  force_destroy = true

  tags = local.tags
}

module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.44.0"

  name = "app"

  #aliases          = ["assets.cloudposse.com"]
  #parent_zone_id       = aws_s3_bucket.b.hosted_zone_id

  origin_bucket        = aws_s3_bucket.b.bucket
  origin_force_destroy = true

  tags = local.tags
}
