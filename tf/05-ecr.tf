# https://github.com/cloudposse/terraform-aws-ecr

# IAM Role to be granted ECR permissions
data "aws_iam_role" "ecr" {
  name = var.ecr_role_name
}

module "ecr" {
  source  = "git::https://github.com/cloudposse/terraform-aws-ecr.git?ref=master"
  version = "0.21.0"

  namespace = var.ecr_namespace
  stage     = var.ecr_stage
  name      = var.ecr_name

  principals_full_access     = [data.aws_iam_role.ecr.arn]
  principals_readonly_access = var.ecr_principals_readonly

  enabled    = var.ecr_enabled
  attributes = var.ecr_attributes

  enable_lifecycle_policy = var.ecr_lifecycle_policy

  image_names          = var.ecr_image_names
  image_tag_mutability = var.ecr_image_tag
  max_image_count      = var.ecr_max_image

  scan_images_on_push = var.ecr_scan_images_on_push

  #tags = {
  #  "name" = "ecr"
  #}
}