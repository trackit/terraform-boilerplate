# https://github.com/cloudposse/terraform-aws-ecr

resource "aws_iam_role" "ecr" {
  name = var.ecr_role_name

  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "AllowPushPull",
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload"
            ]
        }
    ]
}
EOF
}

module "ecr" {
  source = "git::https://github.com/cloudposse/terraform-aws-ecr.git?ref=0.21.0"

  namespace = var.ecr_namespace
  stage     = var.ecr_stage
  name      = var.ecr_name

  principals_full_access     = [aws_iam_role.ecr.arn]
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