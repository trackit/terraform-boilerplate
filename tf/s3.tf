# https://github.com/terraform-aws-modules/terraform-aws-s3-bucket/tree/v1.12.0

module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 1.12.0"

  ## Name of the bucket, should be unique in all accounts/regions
  bucket = var.s3_name
  ## https://docs.aws.amazon.com/fr_fr/AmazonS3/latest/dev/acl-overview.html#canned-acl
  acl = var.s3_acl
  ## Indicates if all objects will be deleted from the bucket so that the bucket can be destroyed without error
  force_destroy = false

  block_public_acls   = true
  block_public_policy = true

  attach_policy = true
  policy        = data.aws_iam_policy_document.s3.json

  versioning = {
    enabled = var.s3_versioning
  }

  # logging = {
  #   target_bucket = module.other_s3.this_s3_bucket_id
  #   target_prefix = "log/"
  # }

  ## List of lifecycle rules
  ## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#lifecycle_rule
  lifecycle_rule = []

  ## Website redirection rule
  ## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#website
  website = {
    index_document = "index.html"
    error_document = "error.html"
    ## ...
  }

  ## List of CORS rules
  cors_rule = [{
    ## Specifies which origins are allowed.
    allowed_origins = ["*"]
    ## Specifies which methods are allowed. Can be GET, PUT, POST, DELETE or HEAD.
    allowed_methods = ["GET", "HEAD"]
    ## Specifies which headers are allowed
    allowed_headers = ["Content-Length", "Content-Type", "Accept", "x-amz-*"]
    ## Specifies expose header in the response.
    expose_headers = ["ETag", "Content-Length", "Content-Type", "x-amz-*"]
    ## Specifies time in seconds that browser can cache the response for a preflight request.
    max_age_seconds = 3000
  }]

  tags = local.tags
}

data "aws_iam_policy_document" "s3" {
}

##### S3 Objects
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object

## Folder
resource "aws_s3_bucket_object" "folder" {
  bucket       = module.s3.this_s3_bucket_id
  acl          = "private"
  key          = "test/"
  content_type = "application/x-directory"
  tags         = local.tags
}

## File
resource "aws_s3_bucket_object" "file" {
  bucket       = module.s3.this_s3_bucket_id
  acl          = "private"
  key          = "test2/lambda.py"
  source       = var.lambda_source
  etag         = filemd5(var.lambda_source)
  tags         = local.tags
}

##### S3 Notifications
## https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification

## Lambda on file upload
resource "aws_s3_bucket_notification" "s3_lambda_on_upload" {
  bucket = module.s3.this_s3_bucket_id

  lambda_function {
    lambda_function_arn = module.lambda_function.this_lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "input/"
    filter_suffix       = ".zip"
  }
}
