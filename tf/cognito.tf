# https://registry.terraform.io/modules/lgallard/cognito-user-pool/aws/0.6.2

module "aws_cognito_user_pool" {
  source  = "lgallard/cognito-user-pool/aws"
  version = "0.6.2"

  user_pool_name           = var.user_pool_name
  alias_attributes         = var.cognito_alias_attributes
  auto_verified_attributes = var.cognito_auto_verified_attributes

  admin_create_user_config = var.cognito_admin_create_user_config

  email_configuration = var.cognito_email_configuration

  password_policy = {
    minimum_length                   = 10
    require_lowercase                = false
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 30
  }

  schemas = var.cognito_schemas

  string_schemas = var.cognito_string_schemas

  client_name = ""

  tags = local.tags
}