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

variable "ecr_role_name" {
  type        = string
  description = "The name of the ecr role"
}

variable "ecr_namespace" {
  type        = string
  description = "Namespace (e.g. eg or cp)"
}

variable "ecr_stage" {
  type        = string
  description = "Stage (e.g. prod, dev, staging)"
}

variable "ecr_name" {
  type        = string
  description = "The Name of the application or solution (e.g. bastion or portal)"
}

variable "ecr_principals_readonly" {
  type        = list(string)
  description = "Principal ARNs to provide with readonly access to the ECR"
}

variable "ecr_enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
}

variable "ecr_attributes" {
  type        = list(string)
  description = "Additional attributes (e.g. policy or role)"
}

variable "ecr_lifecycle_policy" {
  type        = bool
  description = "Set to false to prevent the module from adding any lifecycle policies to any repositories"
}

variable "ecr_image_names" {
  type        = list(string)
  description = "List of Docker local image names, used as repository names for AWS ECR"
}

variable "ecr_image_tag" {
  type        = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
}

variable "ecr_max_image" {
  type        = number
  description = "How many Docker Image versions AWS ECR will store"
}

variable "ecr_scan_images_on_push" {
  type        = bool
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)"
}

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