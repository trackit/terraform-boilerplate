# https://github.com/cloudposse/terraform-aws-backup/tree/0.4.0

resource "aws_ebs_volume" "example" {
  availability_zone = var.vpc_azs[0]
  size              = 1

  tags = {
    Terraform          = "true"
    Environment        = var.env
    TerraformWorkspace = terraform.workspace
  }
}

module "backup" {
  source = "git::https://github.com/cloudposse/terraform-aws-backup.git?ref=tags/0.4.0"

  name = var.backup_name

  ## Backup Rule
  schedule          = var.backup_schedule
  start_window      = var.backup_start_window
  completion_window = var.backup_completion_window
  ## Backup Rule Action
  destination_vault_arn = var.backup_destination_vault_arn
  ## Backup Rule Lifecycle
  cold_storage_after = var.backup_cold_storage_after
  delete_after       = var.backup_delete_after

  ## Backup resources
  backup_resources = [
    ##### List of ARN of resources to assign a backup plan. #####
    ### EBS Volume
    #module.ebs.arn,
    aws_ebs_volume.example.arn,
    ### RDS
    #module.rds.arn,
    #aws_db_instance.example.arn,
    ### DynamoDB
    #module.dynamodb.arn,
    #aws_dynamodb_table.example.arn,
    ### EFS
    #module.efs.arn,
    #aws_efs_file_system.example.arn,
    ### EC2
    #module.ec2.arn,
    #aws_instance.example.arn,
    ### Storage Gateway
    #module.storagegateway.arn,
    #aws_storagegateway_gateway.example.arn,
    ##########################################
  ]

  tags = {
    Terraform          = "true"
    Environment        = var.env
    TerraformWorkspace = terraform.workspace
  }
}

##### Add Tag selection #####

#data "aws_iam_policy_document" "aws_backup_tag_assume_role" {
#  statement {
#    effect  = "Allow"
#    actions = ["sts:AssumeRole"]
#
#    principals {
#      type        = "Service"
#      identifiers = ["backup.amazonaws.com"]
#    }
#  }
#}

#resource "aws_iam_role" "aws_backup_tag" {
#  name               = "aws-backup-tag-selection-production"
#  assume_role_policy = join("", data.aws_iam_policy_document.aws_backup_tag_assume_role.*.json)
#  tags = {
#
#  }
#}

#resource "aws_iam_role_policy_attachment" "aws_backup_tag" {
#  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
#  role       = join("", aws_iam_role.aws_backup_tag.*.name)
#}

#resource "aws_backup_selection" "tag_selection" {
#  iam_role_arn = aws_iam_role.aws_backup_tag.arn
#  name         = "production_tag_backup_selection"
#  plan_id      = split(":", module.backup.backup_plan_arn)[6]
#
#  selection_tag {
#    type  = "STRINGEQUALS"
#    key   = "AWSBackup"
#    value = "production"
#  }
#}

##########################################
