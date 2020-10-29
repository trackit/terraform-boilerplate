#
# https://github.com/cloudposse/terraform-aws-codebuild?ref=0.21.0
#

module "codebuild" {
  source = "git::https://github.com/cloudposse/terraform-aws-codebuild.git?ref=0.21.0"
  name   = var.codebuild_name

  build_image        = var.codebuild_image
  build_compute_type = var.codebuild_compute_type
  build_timeout      = var.codebuild_timeout

  privileged_mode = var.codebuild_privileged_mode

  artifact_type = var.codebuild_artifact_type

  github_token = var.github_token

  environment_variables = [
    {
      name = "EXAMPLE_ENV_VARIABLE_NAME"
      value = "EXAMPLE_ENV_VARIABLE_VALUE"
    },
  ]

  tags = local.tags
}
