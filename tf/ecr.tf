# https://github.com/cloudposse/terraform-aws-ecr/tree/0.27.0

module "ecr" {
  source = "git::https://github.com/cloudposse/terraform-aws-ecr.git?ref=0.27.0"

  name = var.ecr_name

  //principals_full_access     = [aws_iam_role.ecr.arn]
  // Principal ARNs to provide with readonly access to the ECR
  principals_readonly_access = []

  attributes = var.ecr_attributes

  // Set to false to prevent the module from adding any lifecycle policies to any repositories
  enable_lifecycle_policy = true

  image_names = var.ecr_image_names
  // The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE
  image_tag_mutability = "MUTABLE"
  max_image_count      = var.ecr_max_image

  scan_images_on_push = var.ecr_scan_images_on_push

  tags = local.tags
}
