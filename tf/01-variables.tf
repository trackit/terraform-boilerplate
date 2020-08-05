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
// CodeDeploy ECS variables
*/

variable "codedeploy_name" {
  type        = string
  description = "The codedeploy resources name"
}

variable "codedeploy_description" {
  type        = string
  description = "The codedeploy resource description"
}

variable "ecs_cluster_name" {
  type        = string
  description = "The ECS cluster name"
}

variable "ecs_service_name" {
  type        = string
  description = "The ECS service name"
}

variable "codedeploy_lb_listener_arns" {
  type        = list(string)
  description = "The load balancer listeners ARNs"
}

variable "codedeploy_auto_rollback_enabled" {
  type        = bool
  description = "Enable or not the auto rollback"
}

variable "codedeploy_auto_rollback_events" {
  type        = list(string)
  description = "Events that trigger auto rollback (DEPLOYMENT_FAILURE, DEPLOYMENT_STOP_ON_ALARM)"
  default     = ["DEPLOYMENT_FAILURE"]
}

variable "codedeploy_action_on_timeout" {
  type        = string
  description = "Choose between continue or stop deployement (CONTINUE_DEPLOYMENT, STOP_DEPLOYMENT)"
  default     = "STOP_DEPLOYMENT"
}

variable "codedeploy_wait_time_in_minutes" {
  type        = number
  description = "The number of minutes to wait before the status of a blue/green deployment changed to Stopped if rerouting is not started manually"
  default     = 0
}

variable "codedeploy_termination_wait_in_minutes" {
  type        = number
  description = "Wait time in minutes before terminating the old instance when a deployement succeed"
  default     = 5
}

variable "codedeploy_lb_target_group_blue_name" {
  type        = string
  description = "Load balancer target group blue name"
}

variable "codedeploy_lb_target_group_green_name" {
  type        = string
  description = "Load balancer target group green name"
}

variable "codedeploy_tags" {
  type        = map(string)
  description = "Tags for CodeDeploy module"
}

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