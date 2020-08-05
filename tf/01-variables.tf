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

variable "lambda_name" {
  type        = string
  description = "Name of the lambda"
}

variable "lambda_desc" {
  type        = string
  description = "Description of the lambda"
}

variable "lambda_handler" {
  type        = string
  description = "Lambda Function entry point in your code"
}

variable "lambda_runtime" {
  type        = string
  description = "Lambda Function runtime"
}

variable "lambda_publish" {
  type        = bool
  description = "Whether to publish creation/change as new Lambda Function Version."
}

variable "lambda_at_edge" {
  type        = bool
  description = "Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function"
}

variable "lambda_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code"
}

variable "lambda_s3_store" {
  type        = bool
  description = "Whether to store produced artifacts on S3 or locally."
}

variable "lambda_s3_name" {
  type        = string
  description = "S3 bucket to store artifacts"
}

variable "lambda_create_package" {
  type        = bool
  description = "Controls whether Lambda package should be created"
}

variable "lambda_local_package" {
  type        = string
  description = "The absolute path to an existing zip-file to use"
}

variable "api_gateway_arn" {
  type        = string
  description = "APIGateway to allow APIGatewayAny to be triggered by the lambda"
}

variable "api_gateway_source_arn" {
  type        = string
  description = "APIGateway arn to allow APIGatewayDevPost to be triggered by the lambda"
}

variable "lambda_principal" {
  type        = string
  description = "Principal of the lambda"
}

variable "lambda_rule_source_arn" {
  type        = string
  description = "ARN of the rule"
}

variable "lambda_s3_bucket" {
  type        = string
  description = "S3 Bucket destination of the lambda"
}

variable "lambda_s3_source" {
  type        = string
  description = "The absolute path to a local file or directory containing your Lambda source code"
}

variable "lambda_s3layer" {
  type        = bool
  description = "Controls whether Lambda Layer resource should be created"
}

variable "lambda_s3layer_name" {
  type        = string
  description = "Name of Lambda Layer to create"
}

variable "lambda_s3layer_desc" {
  type        = string
  description = "Description of your Lambda Function (or Layer)"
}

variable "lambda_s3layer_compatible_runtimes" {
  type        = list(string)
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
}

variable "lambda_s3layer_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code (or Layer)"
}

variable "lambda_s3layer_store" {
  type        = bool
  description = "Whether to store produced artifacts on S3 or locally."
}

variable "lambda_bucket_layer_name" {
  type        = string
  description = "S3 bucket to store artifacts"
}

variable "lambda_layer" {
  type        = bool
  description = "Controls whether Lambda Layer resource should be created"
}

variable "lambda_layer_name" {
  type        = string
  description = "Name of Lambda Layer to create	"
}

variable "lambda_layer_desc" {
  type        = string
  description = "Description of your Lambda Function (or Layer)"
}

variable "lambda_layer_compatible_runtimes" {
  type        = list(string)
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
}

variable "lambda_layer_source" {
  type        = any
  description = "The absolute path to a local file or directory containing your Lambda source code (or Layer)"
}

variable "lambda_attach_ntw_policy" {
  type        = bool
  description = "Controls whether VPC/network policy should be added to IAM role for Lambda Function"
}

/*
// AutoScalling variables
*/



/*
// Backup variables
*/