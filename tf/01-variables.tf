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
// Elasticache variables
*/

variable "redis_availability_zones" {
  type        = list(string)
  description = "Availability zone IDs"
  default     = []
}

variable "redis_namespace" {
  type        = string
  description = "Namespace (e.g. eg or cp)"
  default     = ""
}

variable "redis_stage" {
  type        = string
  description = "Stage (e.g. prod, dev, staging)"
  default     = ""
}

variable "redis_name" {
  type        = string
  description = "Name of the application"
  default     = ""
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
  default     = 0
}

variable "redis_cluster_mode_replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 0
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
}

variable "redis_dns_subdomain" {
  type        = string
  description = "The subdomain to use for the CNAME record. If not provided then the CNAME record will use var.name."
  default     = ""
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name for the ElastiCache instance"
  default     = ""
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
  default     = ""
}

variable "redis_use_existing_security_groups" {
  type        = bool
  description = "Flag to enable/disable creation of Security Group in the module. Set to true to disable Security Group creation and provide a list of existing security Group IDs in existing_security_groups to place the cluster into"
  default     = false
}
