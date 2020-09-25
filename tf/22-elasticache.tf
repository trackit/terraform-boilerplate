# https://github.com/cloudposse/terraform-aws-elasticache-redis

resource "aws_elasticache_subnet_group" "elasticache_test_subnet_group" {
  name       = "tf-test-cache-subnet"
  subnet_ids = module.vpc.private_subnets
}

module "redis" {
  source = "git::https://github.com/cloudposse/terraform-aws-elasticache-redis.git?ref=0.18.1"

  availability_zones = var.redis_availability_zones

  namespace = var.redis_namespace
  stage     = var.redis_stage
  name      = var.redis_name
  zone_id   = var.redis_zone_id

  vpc_id                  = module.vpc.vpc_id
  allowed_security_groups = [module.vpc.default_security_group_id]
  subnets                 = module.vpc.private_subnets

  cluster_size                         = var.redis_cluster_size
  cluster_mode_enabled                 = var.redis_cluster_mode_enabled
  cluster_mode_num_node_groups         = var.redis_cluster_mode_num_node_groups
  cluster_mode_replicas_per_node_group = var.redis_cluster_mode_replicas_per_node_group

  apply_immediately          = true
  automatic_failover_enabled = false

  instance_type              = var.redis_instance_type
  engine_version             = var.redis_engine_version
  family                     = var.redis_family
  at_rest_encryption_enabled = var.redis_at_rest_encryption_enabled
  transit_encryption_enabled = var.redis_transit_encryption_enabled

  allowed_cidr_blocks = var.redis_allowed_cidr_blocks

  attributes = var.redis_attributes

  auth_token = var.redis_auth_token

  dns_subdomain = var.redis_dns_subdomain

  elasticache_subnet_group_name = aws_elasticache_subnet_group.elasticache_test_subnet_group.name

  enabled = var.redis_enabled

  port = var.redis_port

  replication_group_id = var.redis_replication_group_id

  use_existing_security_groups = var.redis_use_existing_security_groups

  tags = {
    Terraform          = "true"
    Environment        = var.env
    TerraformWorkspace = terraform.workspace
  }

  #parameter = [
  #  {
  #    name  = "notify-keyspace-events"
  #    value = "lK"
  #  }
  #]
}