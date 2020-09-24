# https://github.com/cloudposse/terraform-aws-backup/tree/0.4.0

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
    #aws_ebs_volume._.arn,
    #data.aws_ebs_volume._.arn,
    ### RDS
    #module.rds.arn,
    #aws_db_instance._.arn,
    #data.aws_db_instance._.arn,
    ### DynamoDB
    #module.dynamodb.arn,
    #aws_dynamodb_table._.arn,
    #data.aws_dynamodb_table._.arn,
    ### EFS
    #module.efs.arn,
    #aws_efs_file_system._.arn,
    #data.aws_efs_file_system._.arn,
    ### EC2
    #module.ec2.arn,
    #aws_instance._.arn,
    #data.aws_instance._.arn,
    ### Storage Gateway
    #module.storagegateway.arn,
    #aws_storagegateway_gateway._.arn,
    #data.aws_storagegateway_gateway._.arn,
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
