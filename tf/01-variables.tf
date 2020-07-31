/*
// Common variables
*/

variable "region" {
  type        = string
  description = "Region to work on."
}

variable "env" {
  type        = string
  description = "Stage to work on (dev/stg/prod)."
}

/*
// VPC variables
*/



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
  type = string
  description = "Name of the lambda"
}

variable "lambda_desc" {
  type = string
  description = "Description of the lambda"
}

variable "lambda_handler" {
  type = string
  description = "Lambda Function entry point in your code"
}

variable "lambda_runtime" {
  type = string
  description = "Lambda Function runtime"
}

variable "lambda_publish" {
  type = bool
  description = "Whether to publish creation/change as new Lambda Function Version."
}

variable "lambda_at_edge" {
  type = bool
  description = "Set this to true if using Lambda@Edge, to enable publishing, limit the timeout, and allow edgelambda.amazonaws.com to invoke the function"
}

variable "lambda_source" {
  type = any
  description = "The absolute path to a local file or directory containing your Lambda source code"
}

/*
// AutoScalling variables
*/



/*
// Backup variables
*/