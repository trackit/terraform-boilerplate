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

variable "codebuild_name" {
  type        = string
  description = "Name of codebuild module"
<<<<<<< HEAD
  default     = "codebuild"
=======
>>>>>>> 1fffe8a711b5f9ff1796eef36e9fc86506651c9b
}

variable "codebuild_image" {
  type        = string
  description = "Build container_image"
  default     = "aws/codebuild/standard:2.0"
}

variable "codebuild_compute_type" {
  type        = string
  description = "Instance type for build"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "codebuild_timeout" {
  type        = number
  description = "Timeout build time in minutes"
  default     = 60
}

variable "codebuild_privileged_mode" {
  type        = bool
  description = "Enables docker daemon inside docker container of the instance"
  default     = true
}

variable "codebuild_artifact_type" {
  type        = string
  description = "Build output artifact type: CODEPIPELINE, NO_ARTIFACTS or S3"
  default     = "CODEPIPELINE"
}

variable "github_token" {
  type        = string
  description = "Github token to use for retrieving repository"
}

variable "codebuild_env_variables" {
  type = list(object({
    name  = string
    value = string
  }))
  description = "Environment variables to transfer to build container"
}

variable "codebuild_tags" {
  type        = map(string)
  description = "Codebuild resources tags"
  default     = {}
}

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