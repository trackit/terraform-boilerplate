resource "aws_security_group" "rds_security_group" {
  name        = "rds-security-group"
  description = "Security group for RDS"
  vpc_id      = module.vpc.vpc_id
  ingress {
    description = "RDS accessible from VPC"
    from_port   = var.rds_port
    to_port     = var.rds_port
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
    Name = "rds_security_group"
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.18.0"

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

  vpc_security_group_ids = [aws_security_group.rds_security_group.id]

  maintenance_window = var.rds_maintenance
  backup_window      = var.rds_backup

  monitoring_interval  = var.rds_monitoring_interval
  monitoring_role_name = var.rds_monitoring_role_name

  tags = {
    Terraform          = "true"
    Environnment       = var.env
    TerraformWorkspace = terraform.workspace
  }

  subnet_ids = module.vpc.database_subnets

  family = var.rds_family

  major_engine_version = var.rds_major_engine_version

  final_snapshot_identifier = var.final_snapshot_identifier

  deletion_protection = true
}