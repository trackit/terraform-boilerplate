# https://github.com/cloudposse/terraform-aws-codebuild

module "build" {
  source                        = "git::https://github.com/cloudposse/terraform-aws-codebuild.git?ref=0.21.0"
  namespace                     = var.codebuild_namespace
  stage                         = var.env
  name                          = var.codebuild_name

  build_image                   = var.codebuild_image
  build_compute_type            = var.codebuild_compute_type
  build_timeout                 = var.codebuild_timeout

  privileged_mode               = var.codebuild_privileged_mode
  image_repo_name               = var.codebuild_target_repo_name
  image_tag                     = var.codebuild_image_tag

  artifact_type                 = var.codebuild_artifact_type

  source_credential_server_type = var.codebuild_provider
  github_token                  = var.github_token

  environment_variables         = var.codebuild_env_variables
}