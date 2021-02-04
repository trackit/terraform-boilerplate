# https://registry.terraform.io/modules/npalm/gitlab-runner/aws/4.21.0

resource "local_file" "public_ssh_key" {
  filename = var.gitlab_public_ssh_key_file
}

module "runner" {
  source  = "npalm/gitlab-runner/aws"
  version = "~> 4.21.0"

  aws_region  = var.region
  aws_zone    = var.gitlab_aws_zone
  environment = var.gitlab_environment

  vpc_id                   = module.vpc.vpc_id
  subnet_ids_gitlab_runner = module.vpc.private_subnets
  subnet_id_runners        = element(module.vpc.private_subnets, 0)

  runners_name       = var.gitlab_runners_name
  runners_gitlab_url = var.gitlab_runners_url

  gitlab_runner_registration_config = {
    registration_token = var.gitlab_runner_token
    description        = var.gitlab_runner_description
    tag_list           = ""
    locked_to_project  = "true"
    run_untagged       = "false"
    maximum_timeout    = "3600"
    access_level       = "not_protected"
  }
  agent_tags = var.gitlab_agent_tags

  #cache_bucket = var.gitlab_cache_bucket
  #cache_bucket_name_include_account_id = var.gitlab_cache_bucket_name_include_account_id
  #cache_bucket_prefix = var.gitlab_cache_bucket_prefix
  #cache_bucket_versioning = var.gitlab_cache_bucket_versioning
  #cache_expiration_days = var.gitlab_cache_expiration_days
  #cache_shared = var.gitlab_cache_shared

  #cloudwatch_logging_retention_in_days = var.gitlab_cloudwatch_retention_logs
  #enable_cloudwatch_logging = var.gitlab_cloudwatch_logging

  /*
  docker_machine_download_url   = var.gitlab_docker_download_url
  docker_machine_instance_type  = var.gitlab_docker_instance_type
  docker_machine_options        = var.gitlab_docker_options
  docker_machine_role_json      = var.gitlab_docker_role_json
  docker_machine_spot_price_bid = var.gitlab_docker_spot_price_bid
  docker_machine_version        = var.gitlab_docker_version
  #enable_docker_machine_ssm_access = var.gitlab_enable_docker_ssm_access

  enable_eip                      = var.gitlab_enable_eip
  enable_gitlab_runner_ssh_access = var.gitlab_enable_ssh_access
  enable_kms                      = var.gitlab_enable_kms
  enable_manage_gitlab_token      = var.gitlab_enable_manage_token
  enable_ping                     = var.gitlab_enable_ping
  #enable_runner_ssm_access          = var.gitlab_enable_runner_ssm_access
  enable_runner_user_data_trace_log = var.gitlab_enable_runner_user_data_log
  enable_schedule                   = var.gitlab_enable_schedule

  enable_asg_recreation = var.gitlab_enable_asg_recreation

  allow_iam_service_linked_role_creation = var.gitlab_allow_iam_service_linked_role_creation
  ami_filter                             = var.gitlab_ami_filter
  ami_owners                             = var.gitlab_ami_owners

  arn_format = var.gitlab_arn_format
  */

  tags = local.tags
}
