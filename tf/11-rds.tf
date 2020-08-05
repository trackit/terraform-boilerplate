resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Security group for RDS"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_tls"
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = var.rds_identifier

  availability_zone = var.rds_availability_zone

  engine            = var.rds_engine
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance
  allocated_storage = var.rds_storage

  name     = var.rds_name
  username = var.rds_username
  password = var.rds_password
  port     = var.rds_port

  iam_database_authentication_enabled = true

  vpc_security_group_ids = aws_security_group.rds_security_group.id

  maintenance_window = var.rds_maintenance
  backup_window      = var.rds_backup

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = var.rds_monitoring_interval
  monitoring_role_arn    = var.rds_monitoring_role_arn
  monitoring_role_name   = var.rds_monitoring_role_name
  create_monitoring_role = true

  #tags = {
  #  Owner       = "user"
  #  Environment = "dev"
  #}

  # DB subnet group
  subnet_ids = module.vpc.database_subnets

  # DB parameter group
  family = var.rds_family

  # DB option group
  major_engine_version = var.rds_major_engine_version

  # Snapshot name upon DB deletion
  final_snapshot_identifier = var.final_snapshot_identifier

  # Database Deletion Protection
  deletion_protection = true

  #parameters = [
  #  {
  #    name = "character_set_client"
  #    value = "utf8"
  #  },
  #  {
  #    name = "character_set_server"
  #    value = "utf8"
  #  }
  #]

  #options = [
  #  {
  #    option_name = "MARIADB_AUDIT_PLUGIN"
  #
  #    option_settings = [
  #      {
  #        name  = "SERVER_AUDIT_EVENTS"
  #        value = "CONNECT"
  #      },
  #      {
  #        name  = "SERVER_AUDIT_FILE_ROTATIONS"
  #        value = "37"
  #      },
  #    ]
  #  },
  #]
}