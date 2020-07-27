module "elasticsearch" {
  source                         = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=0.17.0"

  namespace                      = var.es_namespace
  name                           = var.es_name
  stage                          = var.env
  elasticsearch_version          = var.es_version

  dns_zone_id                    = var.dns_zone_id
  security_groups                = var.elastic_search

  vpc_enabled                    = var.vpc_enabled

  vpc_id                         = var.vpc_id
  subnet_ids                     = var.private_subnet_ids
  zone_awareness_enabled         = var.es_zone

  instance_type                  = var.es_instance_type
  instance_count                 = var.es_instance_count

  iam_role_arns                  = var.es_iam_role_arns
  iam_actions                    = var.es_iam_actions

  encrypt_at_rest_enabled        = var.es_encrypt_at_rest

  elasticsearch_subdomain_name   = var.es_subdoamin
  kibana_subdomain_name          = var.es_kibana_subdomain

  create_iam_service_linked_role = var.create_es_service_role

  cognito_authentication_enabled = var.enable_kibana_cognito
  cognito_iam_role_arn           = var.kibana_cognito_iam_role_arn
  cognito_identity_pool_id       = var.kibana_cognito_identity_pool_id
  cognito_user_pool_id           = var.kibana_cognito_user_pool_id

  #advanced_options = {
  #  "rest.action.multi.allow_explicit_index" = "true"
  #}
}