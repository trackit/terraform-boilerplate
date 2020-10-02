#
# https://github.com/cloudposse/terraform-aws-codebuild
#

module "build" {
  source = "git::https://github.com/cloudposse/terraform-aws-codebuild.git?ref=0.21.0"
  stage  = var.env
  name   = var.codebuild_name

  build_image        = var.codebuild_image
  build_compute_type = var.codebuild_compute_type
  build_timeout      = var.codebuild_timeout

  privileged_mode = var.codebuild_privileged_mode

  artifact_type = var.codebuild_artifact_type

  github_token = var.github_token

  environment_variables = var.codebuild_env_variables

  tags = var.codebuild_tags
}
