module "backup" {
  ## https://github.com/cloudposse/terraform-aws-backup/tree/0.4.0
  source = "git::https://github.com/cloudposse/terraform-aws-backup.git?ref=tags/0.4.0"

  name = var.backup_name

  ### Backup Rule
  ## AWS CRON expression specifying when backup job is initiated
  schedule = "cron(0 12 * * ? *)" // Every day at 12:00PM
  ## Minutes before beginning a backup
  start_window = 60
  ## Minutes before canceling the job and returning an error
  completion_window = 120

  ### Backup Rule Action
  ## ARN of the destination backup vault for the copied backup
  # destination_vault_arn = null

  ### Backup Rule Lifecycle
  ## Number of days after creation that a recovery point is moved to cold storage
  cold_storage_after = 7
  ## Number of days after creation that a recovery point is deleted
  delete_after = 30

  ### List of ARN of resources to assign a backup plan.
  backup_resources = [
    ## EBS Volume
    # module.ebs.arn,
    aws_ebs_volume.backup_example.arn,
    ## RDS
    #module.rds.arn,
    #aws_db_instance.backup_example.arn,
    ## DynamoDB
    #module.dynamodb.arn,
    #aws_dynamodb_table.backup_example.arn,
    ## EFS
    #module.efs.arn,
    #aws_efs_file_system.backup_example.arn,
    ## EC2
    #module.ec2.arn,
    #aws_instance.backup_example.arn,
    ## Storage Gateway
    #module.storagegateway.arn,
    #aws_storagegateway_gateway.backup_example.arn,
  ]

  tags = local.tags
}

##### Add Tag selection #####

resource "aws_iam_role" "backup_tags" {
  name = "backup-${var.backup_name}-tag-selection"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "backup.amazonaws.com"
        }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "backup_tags" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.backup_tags.name
}

resource "aws_backup_selection" "tag_selection" {
  iam_role_arn = aws_iam_role.backup_tags.arn
  name         = "${var.backup_name}-tag-selection"
  plan_id      = split(":", module.backup.backup_plan_arn)[6]

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "AWSBackup"
    value = var.env
  }
}

##########################################

resource "aws_ebs_volume" "backup_example" {
  availability_zone = var.vpc_azs[0]
  size              = 1

  tags = local.tags
}
