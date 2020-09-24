# https://github.com/cloudposse/terraform-aws-ecr

resource "aws_iam_role" "ecr" {
  name = "test-role"
  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ecr.name
  policy_arn = aws_iam_policy.policy.arn
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