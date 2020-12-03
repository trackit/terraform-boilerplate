# https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=0.24.1

module "elasticsearch" {
  source = "git::https://github.com/cloudposse/terraform-aws-elasticsearch.git?ref=0.24.1"
  name   = var.es_name

  dns_zone_id     = var.es_dns_zone_id
  security_groups = [module.vpc.default_security_group_id]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  zone_awareness_enabled = var.es_zone_awareness

  elasticsearch_version = var.es_version
  instance_type         = var.es_instance_type
  instance_count        = 1
  ebs_volume_size       = var.es_volume_size

  elasticsearch_subdomain_name = var.es_subdomain
  domain_hostname_enabled      = var.es_hostname_enabled

  iam_role_arns = var.es_iam_allowed_role_arns
  iam_actions   = var.es_iam_allowed_actions

  encrypt_at_rest_enabled = var.es_encrypt_at_rest

  kibana_subdomain_name   = var.es_kibana_subdomain
  kibana_hostname_enabled = var.es_kibana_hostname_enabled

  tags = local.tags
}