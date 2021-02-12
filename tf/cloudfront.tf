# https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn/tree/0.44.0


module "s3_cdn" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 1.12.0"

  ## Name of the bucket, should be unique in all accounts/regions
  bucket = "tf-boilerplate-cloudfront-bucket"
  ## https://docs.aws.amazon.com/fr_fr/AmazonS3/latest/dev/acl-overview.html#canned-acl
  ## Indicates if all objects will be deleted from the bucket so that the bucket can be destroyed without error
  force_destroy = true

  tags = local.tags
}

module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.44.0"

  name = "app"

  #aliases          = ["assets.cloudposse.com"]
  #parent_zone_id       = aws_s3_bucket.b.hosted_zone_id

  depends_on           = [module.s3_cdn]
  origin_bucket        = module.s3_cdn.bucket
  origin_force_destroy = true

  tags = local.tags
}
