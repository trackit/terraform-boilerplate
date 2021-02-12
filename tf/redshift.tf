module "redshift" {
  source  = "terraform-aws-modules/redshift/aws"
  version = "~> 2.7"

  cluster_identifier      = var.redshift_cluster_name
  cluster_node_type       = var.redshift_node_type
  cluster_number_of_nodes = var.redshift_node_amount

  cluster_database_name   = var.redshift_db_name
  cluster_master_username = var.redshift_db_user
  cluster_master_password = var.redshift_db_master_password

  final_snapshot_identifier = "1"

  subnets = module.vpc.private_subnets
  vpc_security_group_ids = [module.vpc.default_security_group_id]
}
