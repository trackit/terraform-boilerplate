#
# https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/v2.55.0
#

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v2.55.0"

  name             = var.vpc_name
  cidr             = var.vpc_cidr
  azs              = var.vpc_azs
  private_subnets  = var.vpc_private_cidrs
  public_subnets   = var.vpc_public_cidrs
  database_subnets = var.vpc_database_cidrs

  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  create_igw = true

  # propagate_intra_route_tables_vgw = true
  # propagate_private_route_tables_vgw = true
  # propagate_public_route_tables_vgw = true
  # vpn_gateway_id = ""

  #   enable_flow_log           = true
  #   flow_log_destination_type = "s3"
  #   flow_log_destination_arn  = module.s3_bucket_vpc_flow_logs.this_s3_bucket_arn
  #   vpc_flow_log_tags = {
  #     Name = local.s3_bucket_name
  #     Terraform          = "true"
  #     Environnment       = var.env
  #     TerraformWorkspace = terraform.workspace
  #   }

  tags = local.tags
}

# --- Flow Logs Configuration --
# locals {
#   s3_bucket_name = "${var.vpc_name}-vpc-flow-logs-${var.region}"
# }
# module "s3_bucket_vpc_flow_logs" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "~> 1.9"
#   bucket        = local.s3_bucket_name
#   policy        = data.aws_iam_policy_document.flow_log_s3.json
#   force_destroy = true
#   tags = {
#     Name = local.s3_bucket_name
#     Terraform          = "true"
#     Environnment       = var.env
#     TerraformWorkspace = terraform.workspace
#   }
# }
# data "aws_iam_policy_document" "flow_log_s3" {
#   statement {
#     sid = "AWSLogDeliveryWrite"
#     principals {
#       type        = "Service"
#       identifiers = ["delivery.logs.amazonaws.com"]
#     }
#     effect = "Allow"
#     actions = [
#       "s3:PutObject",
#     ]
#     resources = ["arn:aws:s3:::${local.s3_bucket_name}/AWSLogs/*"]
#   }
#   statement {
#     sid = "AWSLogDeliveryAclCheck"
#     principals {
#       type        = "Service"
#       identifiers = ["delivery.logs.amazonaws.com"]
#     }
#     effect = "Allow"
#     actions = [
#       "s3:GetBucketAcl",
#     ]
#     resources = ["arn:aws:s3:::${local.s3_bucket_name}"]
#   }
# }
