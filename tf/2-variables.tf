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

variable "route53_zone_name" {
  type        = string
  description = "This is the name of the hosted zone."
  default     = "example.com"
}

variable "route53_records" {
  type        = list(string)
  description = "A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \"\" inside the Terraform configuration string"
  default     = null
}

variable "route53_type" {
  type        = string
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
  default     = "A"
}

variable "route53_ttl" {
  type        = string
  description = "The TTL of the record."
  default     = "300"
}

variable "route53_record_name" {
  type        = string
  description = "The name of the record."
  default     = "www.example.com"
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
