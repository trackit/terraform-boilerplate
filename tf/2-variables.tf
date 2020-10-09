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
// ACM variables
*/



/*
// ALB variables
*/



/*
// AutoScalling variables
*/



/*
// Backup variables
*/



/*
// Client VPN variables
*/



/*
// CloudTrail variables
*/



/*
// CodeBuild variables
*/



/*
// CodeCommit variables
*/



/*
// CodeDeploy variables
*/



/*
// CodePipeline variables
*/



/*
// EC2 variables
*/



/*
// ECR variables
*/



/*
// EKS variables
*/



/*
// ElastiCache variables
*/

variable "redis_name" {
  type        = string
  description = "Name of the application"
  default     = "redis-name"
}

variable "redis_availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
  default     = ["us-east-1a"]
}

variable "redis_zone_id" {
  type        = string
  description = "Route53 DNS Zone ID"
  default     = ""
}

variable "redis_cluster_size" {
  type        = number
  description = "Number of nodes in cluster. *Ignored when cluster_mode_enabled == true*"
  default     = 1
}

variable "redis_cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. automatic_failover_enabled must be set to true. Only 1 cluster_mode block is allowed"
  default     = false
}

variable "redis_cluster_mode_num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications"
  default     = 1
}

variable "redis_cluster_mode_replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 1
}

variable "redis_instance_type" {
  type        = string
  description = "Elastic cache instance type"
  default     = "cache.t2.micro"
}

variable "redis_engine_version" {
  type        = string
  description = "Redis engine version"
  default     = "4.0.10"
}

variable "redis_family" {
  type        = string
  description = "Redis family"
  default     = "redis4.0"
}

variable "redis_at_rest_encryption_enabled" {
  type        = bool
  description = "Enable encryption at rest"
  default     = false
}

variable "redis_transit_encryption_enabled" {
  type        = bool
  description = "Enable TLS"
  default     = true
}

variable "redis_allowed_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks that are allowed ingress to the cluster's Security Group created in the module"
  default     = []
}

variable "redis_attributes" {
  type        = list(string)
  description = "Additional attributes (_e.g._ '1')"
  default     = []
}

variable "redis_auth_token" {
  type        = string
  description = "Auth token for password protecting redis, transit_encryption_enabled must be set to true. Password must be longer than 16 chars"
  default     = "123456789ABCDEFG"
}

variable "redis_dns_subdomain" {
  type        = string
  description = "The subdomain to use for the CNAME record. If not provided then the CNAME record will use var.name."
  default     = "d"
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name for the ElastiCache instance"
  default     = "subnet-group"
}

variable "redis_enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "redis_port" {
  type        = number
  description = "Redis port"
  default     = 6379
}

variable "redis_replication_group_id" {
  type        = string
  description = "Replication group ID with the following constraints: A name must contain from 1 to 20 alphanumeric characters or hyphens. The first character must be a letter. A name cannot end with a hyphen or contain two consecutive hyphens."
  default     = "replication-group"
}

variable "redis_use_existing_security_groups" {
  type        = bool
  description = "Flag to enable/disable creation of Security Group in the module. Set to true to disable Security Group creation and provide a list of existing security Group IDs in existing_security_groups to place the cluster into"
  default     = false
}

/*
// ElasticSearch variables
*/



/*
// Gitlab Runner variables
*/

variable "gitlab_public_ssh_key_file" {
  type        = string
  description = "Path to the local public ssh key file."
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
  default     = false
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

/*
// GuardDuty variables
*/



/*
// Lambda variables
*/

variable "lambda_name" {
  type        = string
  description = "Name of the lambda"
  default     = ""
}

variable "lambda_desc" {
  type        = string
  description = "Description of the lambda"
  default     = ""
}

variable "lambda_handler" {
  type        = string
  description = "Lambda Function entry point in your code"
  default     = ""
}

# See for available runtimes: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
variable "lambda_runtime" {
  type        = string
  description = "Lambda Function runtime"
  default     = ""
}

variable "lambda_publish" {
  type        = bool
  description = "Whether to publish creation/change as new Lambda Function Version."
  default     = false
}

variable "lambda_at_edge" {
  type        = bool
  description = "Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function"
  default     = false
}

variable "lambda_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code"
  default     = null
}

variable "lambda_s3_store" {
  type        = bool
  description = "Whether to store produced artifacts on S3 or locally."
  default     = false
}

variable "lambda_s3_name" {
  type        = string
  description = "S3 bucket to store artifacts"
  default     = null
}

variable "lambda_create_package" {
  type        = bool
  description = "Controls whether Lambda package should be created"
  default     = true
}

variable "lambda_local_package" {
  type        = string
  description = "The absolute path to an existing zip-file to use"
  default     = null
}

variable "api_gateway_arn" {
  type        = string
  description = "APIGateway to allow APIGatewayAny to be triggered by the lambda"
  default     = null
}

variable "api_gateway_source_arn" {
  type        = string
  description = "APIGateway arn to allow APIGatewayDevPost to be triggered by the lambda"
  default     = null
}

variable "lambda_principal" {
  type        = string
  description = "Principal of the lambda"
  default     = null
}

variable "lambda_rule_source_arn" {
  type        = string
  description = "ARN of the rule"
  default     = null
}

variable "lambda_s3_bucket" {
  type        = string
  description = "S3 Bucket destination of the lambda"
  default     = null
}

variable "lambda_s3_source" {
  type        = string
  description = "The absolute path to a local file or directory containing your Lambda source code"
  default     = null
}

variable "lambda_s3layer" {
  type        = bool
  description = "Controls whether Lambda Layer resource should be created"
  default     = null
}

variable "lambda_s3layer_name" {
  type        = string
  description = "Name of Lambda Layer to create"
  default     = ""
}

variable "lambda_s3layer_desc" {
  type        = string
  description = "Description of your Lambda Function (or Layer)"
  default     = ""
}

variable "lambda_s3layer_compatible_runtimes" {
  type        = list(string)
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
  default     = null
}

variable "lambda_s3layer_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code (or Layer)"
  default     = null
}

variable "lambda_s3layer_store" {
  type        = bool
  description = "Whether to store produced artifacts on S3 or locally."
  default     = null
}

variable "lambda_bucket_layer_name" {
  type        = string
  description = "S3 bucket to store artifacts"
  default     = null
}

variable "lambda_layer" {
  type        = bool
  description = "Controls whether Lambda Layer resource should be created"
  default     = null
}

variable "lambda_layer_name" {
  type        = string
  description = "Name of Lambda Layer to create	"
  default     = null
}

variable "lambda_layer_desc" {
  type        = string
  description = "Description of your Lambda Function (or Layer)"
  default     = null
}

variable "lambda_layer_compatible_runtimes" {
  type        = list(string)
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
  default     = null
}

variable "lambda_layer_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code (or Layer)"
  default     = null
}

variable "lambda_attach_ntw_policy" {
  type        = bool
  description = "Controls whether VPC/network policy should be added to IAM role for Lambda Function"
  default     = null
}

/*
// RDS variables
*/



/*
// Route53 variables
*/



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
  type        = list(string)
  description = "Your private subnets"
  default     = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_public_cidrs" {
  type        = list(string)
  description = "Your public subnets"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_database_cidrs" {
  type        = list(string)
  description = "Your database subnets"
  default     = ["10.0.200.0/24", "10.0.201.0/24", "10.0.202.0/24"]
}

variable "vpc_azs" {
  type        = list(string)
  description = "Your VPC availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
