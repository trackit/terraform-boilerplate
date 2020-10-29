# https://github.com/cloudposse/terraform-aws-cloudtrail/tree/0.14.0

module "cloudtrail" {
  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail.git?ref=tags/0.14.0"

  name                          = var.cloudtrail_name
  enable_log_file_validation    = var.cloudtrail_log_file_validation
  include_global_service_events = var.cloudtrail_include_global_service_events
  is_multi_region_trail         = var.cloudtrail_is_multi_region_trail
  enable_logging                = var.cloudtrail_enable_logging
  s3_bucket_name                = module.cloudtrail_s3_bucket.bucket_id
  tags                          = local.tags
}

# https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket/tree/0.12.0

module "cloudtrail_s3_bucket" {
  source = "git::https://github.com/cloudposse/terraform-aws-cloudtrail-s3-bucket.git?ref=tags/0.12.0"

  name = var.cloudtrail_s3_name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Sid : "AWSCloudTrailAclCheck20150319",
        Effect : "Allow",
        Principal : { "Service" : "cloudtrail.amazonaws.com" },
        Action : "s3:GetBucketAcl",
        Resource : "arn:aws:s3:::${var.cloudtrail_s3_name}"
      },
      {
        Sid : "AWSCloudTrailWrite20150319",
        Effect : "Allow",
        Principal : { "Service" : "cloudtrail.amazonaws.com" },
        Action : "s3:PutObject",
        Resource : "arn:aws:s3:::myBucketName/[optional prefix]/AWSLogs/${var.cloudtrail_account_id}/*",
        Condition : { "StringEquals" : { "s3:x-amz-acl" : "bucket-owner-full-control" } }
      }
    ]
  })
  tags = local.tags
}
