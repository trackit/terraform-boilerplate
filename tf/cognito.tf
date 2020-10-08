# https://registry.terraform.io/modules/lgallard/cognito-user-pool/aws/0.6.2

module "aws_cognito_user_pool" {
  source  = "lgallard/cognito-user-pool/aws"
  version = "0.6.2"

  user_pool_name           = "mypool"
  alias_attributes         = var.cognito_alias_attributes
  auto_verified_attributes = var.cognito_auto_verified_attributes

  admin_create_user_config = var.cognito_admin_create_user_config

  email_configuration = var.cognito_email_configuration

  password_policy = var.cognito_password_policy

  schemas = var.cognito_schemas

  string_schemas = var.cognito_string_schemas

  tags = {
    Owner       = "infra"
    Environment = "production"
    Terraform   = true
  }
}