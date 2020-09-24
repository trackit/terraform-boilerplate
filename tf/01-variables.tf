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

variable "backup_name" {
  type        = string
  description = "Name of your AWS Backup"
  default     = ""
}

variable "backup_schedule" {
  type        = string
  description = "CRON expression specifying when backup job is initiated"
  default     = "cron(0 12 * * ? *)"
}

variable "backup_start_window" {
  type        = number
  description = "Minutes before beginning a backup"
  default     = null
}

variable "backup_completion_window" {
  type        = number
  description = "Minutes before canceling the job and returning an error"
  default     = null
}

variable "backup_destination_vault_arn" {
  type        = string
  description = "ARN of the destination backup vault for the copied backup"
  default     = null
}

variable "backup_cold_storage_after" {
  type        = number
  description = "Number of days after creation that a recovery point is moved to cold storage"
  default     = null
}

variable "backup_delete_after" {
  type        = number
  description = "Number of days after creation that a recovery point is deleted"
  default     = null
}
