# https://github.com/cloudposse/terraform-aws-cloudtrail/tree/0.14.0

module "cloudtrail" {
  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail.git?ref=tags/0.14.0"

  name                          = "cluster"
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = false
  enable_logging                = true
  s3_bucket_name                = module.cloudtrail_s3_bucket.bucket_id
  tags                          = local.tags
}

# https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket/tree/0.12.0

module "cloudtrail_s3_bucket" {
  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket.git?ref=tags/0.12.0"
  name   = "cluster"
  tags   = local.tags
}