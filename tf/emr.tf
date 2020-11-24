module "emr_cluster" {
  source                                         = "git::https://github.com/cloudposse/terraform-aws-emr-cluster.git?ref=tags/0.15.0"
  
  name                                           = var.emr_name
  namespace                                      = var.emr_namespace
  stage                                          = var.env
  region                                         = var.region

  master_allowed_security_groups                 = [module.vpc.default_security_group_id]
  slave_allowed_security_groups                  = [module.vpc.default_security_group_id]

  vpc_id                                         = module.vpc.vpc_id
  subnet_id                                      = module.vpc.database_subnets[0]
  route_table_id                                 = module.vpc.database_route_table_ids[0]
  subnet_type                                    = "private"

  ebs_root_volume_size                           = var.emr_ebs_root_volume_size
  visible_to_all_users                           = var.emr_visible_to_all_users
  release_label                                  = var.emr_release_label
  applications                                   = var.emr_applications
  configurations_json                            = var.emr_configurations_json
  
  # Core Instance
  core_instance_group_instance_type              = var.emr_core_instance_group_instance_type
  core_instance_group_instance_count             = var.emr_core_instance_group_instance_count
  core_instance_group_ebs_size                   = var.emr_core_instance_group_ebs_size
  core_instance_group_ebs_type                   = var.emr_core_instance_group_ebs_type
  core_instance_group_ebs_volumes_per_instance   = var.emr_core_instance_group_ebs_volumes_per_instance

  # Master Instance
  master_instance_group_instance_type            = var.emr_master_instance_group_instance_type
  master_instance_group_instance_count           = var.emr_master_instance_group_instance_count
  master_instance_group_ebs_size                 = var.emr_master_instance_group_ebs_size
  master_instance_group_ebs_type                 = var.emr_master_instance_group_ebs_type
  master_instance_group_ebs_volumes_per_instance = var.emr_master_instance_group_ebs_volumes_per_instance


  create_task_instance_group                     = var.emr_create_task_instance_group
  log_uri                                        = format("s3n://%s/", module.s3.this_s3_bucket_id)
  key_name                                       = var.emr_aws_key_pair_name

  tags = local.tags
}