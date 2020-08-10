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

variable "eks_cluster_name" {
  type        = string
  description = "Name of your Kubernetes cluster"
  default     = "kubernetes-cluster"
}

variable "eks_instance_type" {
  type        = string
  description = "Size of your cluster nodes"
  default     = "m5.large"
}

variable "eks_asg_min_size" {
  type        = string
  description = "Min node count"
  default     = "3"
}

variable "eks_asg_max_size" {
  type        = string
  description = "Max node count"
  default     = "5"
}

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

variable "rds_identifier" {
  type        = string
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "rds_availability_zone" {
  type        = string
  description = "The Availability Zone of the RDS instance"
}

variable "rds_engine" {
  type        = string
  description = "The database engine to use"
}

variable "rds_engine_version" {
  type        = string
  description = "The engine version to use"
}

variable "rds_instance" {
  type        = string
  description = "The instance type of the RDS instance"
}

variable "rds_storage" {
  type        = string
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
}

variable "rds_name" {
  type        = string
  description = "The DB name to create. If omitted, no database is created initially"
}

variable "rds_username" {
  type        = string
  description = "Username for the master DB user"
}

variable "rds_password" {
  type        = string
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
}

variable "rds_port" {
  type        = string
  description = "The port on which the DB accepts connections"
}

variable "rds_maintenance" {
  type        = string
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
}

variable "rds_backup" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
}

variable "rds_monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
}

variable "rds_monitoring_role_name" {
  type        = string
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
}

variable "rds_monitoring_role_arn" {
  type        = string
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
}

variable "rds_family" {
  type        = string
  description = "The family of the DB parameter group"
}

variable "rds_major_engine_version" {
  type        = string
  description = "Specifies the major version of the engine that this option group should be associated with"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when this DB instance is deleted."
}

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