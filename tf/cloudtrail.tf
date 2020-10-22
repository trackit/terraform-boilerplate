# https://github.com/cloudposse/terraform-aws-cloudtrail/tree/0.14.0

module "cloudtrail" {
  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail.git?ref=tags/0.14.0"

  name                          = var.cloudtrail_name
  enable_log_file_validation    = var.cloudtrail_log_file_validation
  include_global_service_events = var.cloudtrail_include_global_service_events
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  enable_logging                = var.cloudtrail_enable_logging
  s3_bucket_name                = module.cloudtrail_s3_bucket.this_s3_bucket_id
  tags                          = local.tags
}

# https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket/tree/0.12.0

#module "cloudtrail_s3_bucket" {
#  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket.git?ref=tags/0.12.0"

#  name = var.cloudtrail_s3_name
#  tags = local.tags
#}

module "cloudtrail_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket-for-logs"
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = true

  attach_elb_log_delivery_policy = true
}