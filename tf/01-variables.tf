/*
// Common variables
*/

variable "region" {
  type        = string
  description = "Region to work on."
  default     = "us-east-1"
}

variable "env" {
  type        = string
  description = "Stage to work on (dev/stg/prod)."
  default     = "dev"
}

/*
// VPC variables
*/

variable "vpc_cidr" {
  type        = string
  description = "CIDR of your VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Name of your VPC"
  default     = "terraform-vpc"
}

variable "vpc_private_cidrs" {
  type        = list
  description = "Your private subnets"
  default     = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_public_cidrs" {
  type        = list
  description = "Your public subnets"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_database_cidrs" {
  type        = list
  description = "Your database subnets"
  default     = ["10.0.200.0/24", "10.0.201.0/24", "10.0.202.0/24"]
}

variable "vpc_azs" {
  type        = list
  description = "Your VPC availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

/*
// EKS variables
*/



/*
// ECR variables
*/



/*
// Route53 variables
*/



/*
// EC2 variables
*/



/*
// ACM variables
*/



/*
// ALB variables
*/



/*
// ES variables
*/



/*
// RDS variables
*/



/*
// CloudTrail variables
*/



/*
// GuardDuty variables
*/



/*
// CodePipeline variables
*/



/*
// CodeCommit variables
*/



/*
// CodeBuild variables
*/



/*
// CodeDeploy variables
*/



/*
// Client VPN variables
*/



/*
// Lambda variables
*/



/*
// AutoScalling variables
*/



/*
// Backup variables
*/



/*
// Gitlab Runner variables
*/

variable "gitlab_public_ssh_key_file" {
  type        = string
  description = "Path to the local public ssh key file."
}

variable "gitlab_aws_region" {
  type        = string
  description = "AWS region."
  default     = "us-east1"
}

variable "gitlab_aws_zone" {
  type        = string
  description = "Deprecated. Will be removed in the next major release."
  default     = "us-east-1a"
}

variable "gitlab_environment" {
  type        = string
  description = "A name that identifies the environment, used as prefix and for tagging."
  default     = "dev"
}

variable "gitlab_runners_name" {
  type        = string
  description = "Name of the runner, will be used in the runner config.toml."
  default     = "gitlab-test"
}

variable "gitlab_runners_url" {
  type        = string
  description = "URL of the GitLab instance to connect to."
  default     = ""
}

variable "gitlab_runner_registration_config" {
  type        = map(string)
  description = "Configuration used to register the runner. See the README for an example, or reference the examples in the examples directory of this repo."
  default = {
    "access_level" : "",
    "description" : "",
    "locked_to_project" : "",
    "maximum_timeout" : "",
    "registration_token" : "",
    "run_untagged" : "",
    "tag_list" : ""
  }
}

variable "gitlab_agent_tags" {
  type        = map(string)
  description = "Map of tags that will be added to agent EC2 instances."
  default     = {}
}

variable "gitlab_cache_bucket" {
  type        = map
  description = "Configuration to control the creation of the cache bucket. By default the bucket will be created and used as shared cache. To use the same cache across multiple runners disable the creation of the cache and provide a policy and bucket name. See the public runner example for more details."
  default = {
    "bucket" : "",
    "create" : true,
    "policy" : ""
  }
}

variable "gitlab_cache_bucket_name_include_account_id" {
  type        = bool
  description = "Boolean to add current account ID to cache bucket name."
  default     = true
}

variable "gitlab_cache_bucket_prefix" {
  type        = string
  description = "Prefix for s3 cache bucket name."
  default     = ""
}

variable "gitlab_cache_bucket_versioning" {
  type        = bool
  description = "Boolean used to enable versioning on the cache bucket, false by default."
  default     = false
}

variable "gitlab_cache_expiration_days" {
  type        = number
  description = "Number of days before cache objects expires."
  default     = 1
}

variable "gitlab_cache_shared" {
  type        = bool
  description = "Enables cache sharing between runners, false by default."
  default     = false
}

variable "gitlab_cloudwatch_retention_logs" {
  type        = number
  description = "Retention for cloudwatch logs. Defaults to unlimited"
  default     = 0
}

variable "gitlab_cloudwatch_logging" {
  type        = bool
  description = "Boolean used to enable or disable the CloudWatch logging."
  default     = true
}

variable "gitlab_docker_download_url" {
  type        = string
  description = "Full url pointing to a linux x64 distribution of docker machine. Once set docker_machine_version will be ingored. For example the GitLab version, https://gitlab-docker-machine-downloads.s3.amazonaws.com/v0.16.2-gitlab.2/docker-machine."
  default     = ""
}

variable "gitlab_docker_instance_type" {
  type        = string
  description = "Instance type used for the instances hosting docker-machine."
  default     = "m5.large"
}

variable "gitlab_docker_options" {
  type        = list(string)
  description = "List of additional options for the docker machine config. Each element of this list must be a key=value pair. E.g. '[\"amazonec2-zone=a\"]'"
  default     = []
}

variable "gitlab_docker_role_json" {
  type        = string
  description = "Docker machine runner instance override policy, expected to be in JSON format."
  default     = ""
}

variable "gitlab_docker_spot_price_bid" {
  type        = string
  description = "Spot price bid."
  default     = "0.06"
}

variable "gitlab_docker_version" {
  type        = string
  description = "Version of docker-machine. The version will be ingored once docker_machine_download_url is set."
  default     = "0.16.2"
}

variable "gitlab_enable_docker_ssm_access" {
  type        = bool
  description = "Add IAM policies to the docker-machine instances to connect via the Session Manager."
  default     = false
}

variable "gitlab_enable_eip" {
  type        = bool
  description = "Enable the assignment of an EIP to the gitlab runner instance"
  default     = false
}

variable "gitlab_enable_ssh_access" {
  type        = bool
  description = "Enables SSH Access to the gitlab runner instance."
  default     = false
}

variable "gitlab_enable_kms" {
  type        = bool
  description = "Let the module manage a KMS key, logs will be encrypted via KMS. Be-aware of the costs of an custom key."
  default     = false
}

variable "gitlab_enable_manage_token" {
  type        = bool
  description = "Boolean to enable the management of the GitLab token in SSM. If true the token will be stored in SSM, which means the SSM property is a terraform managed resource. If false the Gitlab token will be stored in the SSM by the user-data script during creation of the the instance. However the SSM parameter is not managed by terraform and will remain in SSM after a terraform destroy."
  default     = true
}

variable "gitlab_enable_ping" {
  type        = bool
  description = "Allow ICMP Ping to the ec2 instances."
  default     = false
}

variable "gitlab_enable_runner_ssm_access" {
  type        = bool
  description = "Add IAM policies to the runner agent instance to connect via the Session Manager."
  default     = false
}

variable "gitlab_enable_runner_user_data_log" {
  type        = bool
  description = "Enable bash xtrace for the user data script that creates the EC2 instance for the runner agent. Be aware this could log sensitive data such as you GitLab runner token."
  default     = false
}

variable "gitlab_enable_schedule" {
  type        = bool
  description = "Flag used to enable/disable auto scaling group schedule for the runner instance."
  default     = false
}

variable "gitlab_enable_asg_recreation" {
  type        = bool
  description = "Enable automatic redeployment of the Runner ASG when the Launch Configs change."
  default     = true
}

variable "gitlab_allow_iam_service_linked_role_creation" {
  type        = bool
  description = "Boolean used to control attaching the policy to a runner instance to create service linked roles."
  default     = true
}

variable "gitlab_ami_filter" {
  type        = map(list(string))
  description = "List of maps used to create the AMI filter for the Gitlab runner agent AMI. Must resolve to an Amazon Linux 1 or 2 image."
  default = {
    "name" : [
      "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
    ]
  }
}

variable "gitlab_ami_owners" {
  type        = list(string)
  description = "The list of owners used to select the AMI of Gitlab runner agent instances."
  default = [
    "099720109477"
  ]
}

variable "gitlab_arn_format" {
  type        = string
  description = "ARN format to be used. May be changed to support deployment in GovCloud/China regions."
  default     = ""
}