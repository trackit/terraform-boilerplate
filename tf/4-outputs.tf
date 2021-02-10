/*
// ACM outputs
*/



/*
// ALB outputs
*/



/*
// AutoScalling outputs
*/



/*
// Backup outputs
*/

output "backup" {
  value = {
    plan_arn  = module.backup.backup_plan_arn
    vault_arn = module.backup.backup_vault_arn
  }
}

/*
// Client VPN outputs
*/



/*
// CloudTrail outputs
*/

output "cloudtrail" {
  value = {
    cloudtrail = {
      id  = module.cloudtrail.cloudtrail_id
      arn = module.cloudtrail.cloudtrail_arn
    },
    s3 = {
      id  = module.cloudtrail_s3_bucket.bucket_id
      arn = module.cloudtrail_s3_bucket.bucket_arn
    }
  }
}

/*
// CodeBuild outputs
*/

output "codebuild" {
  value = {
    arn = module.codebuild.project_arn
    id  = module.codebuild.project_id
  }
}

/*
// CodeCommit outputs
*/



/*
// CodeDeploy outputs
*/



/*
// Cognito outputs
*/

output "cognito" {
  value = {
    arn = module.aws_cognito_user_pool.arn
    id  = module.aws_cognito_user_pool.id
  }
}

/*
// CodePipeline outputs
*/



/*
// EC2 outputs
*/

output "ec2" {
  value = {
    id  = module.ec2-instance.id
    arn = module.ec2-instance.arn
  }
}

/*
// ECR outputs
*/

output "ecr" {
  value = {
    id   = module.ecr.registry_id
    arn  = module.ecr.repository_arn
    name = module.ecr.repository_name
  }
}

/*
// ECS outputs
*/

output "ecs_task_definition" {
  value = {
    id  = aws_ecs_task_definition.task.id
    arn = aws_ecs_task_definition.task.arn
  }
}

output "ecs_service" {
  value = {
    id              = aws_ecs_service.service.id
    name            = aws_ecs_service.service.name
    security_groups = aws_ecs_service.service.network_configuration[0].security_groups
    subnets         = aws_ecs_service.service.network_configuration[0].subnets
  }
}

output "ecs_cluster" {
  value = {
    id   = aws_ecs_cluster.cluster.id
    arn  = aws_ecs_cluster.cluster.arn
    name = aws_ecs_cluster.cluster.name
  }
}

output "ecs_execution_role" {
  value = {
    arn = aws_iam_role.ecs_execution_role.arn
  }
}

output "ecs_task_role" {
  value = {
    arn = aws_iam_role.task_role.arn
  }
}

/*
// EKS outputs
*/

output "eks" {
  value = {
    id       = module.eks.cluster_id
    arn      = module.eks.cluster_arn
    endpoint = module.eks.cluster_endpoint
  }
}

/*
// ElastiCache outputs
*/

output "redis" {
  value = {
    id = module.redis.id
  }
}

/*
// ElasticSearch outputs
*/

output "elasticsearch" {
  value = {
    id   = module.elasticsearch.domain_id
    name = module.elasticsearch.domain_name
    arn  = module.elasticsearch.domain_arn
  }
}

/*
// GuardDuty outputs
*/



/*
// Lambda outputs
*/

output "lambda" {
  value = {
    name = module.lambda_function.this_lambda_function_name
    arn  = module.lambda_function.this_lambda_function_arn
  }
}

/*
// RDS outputs
*/

output "rds" {
  value = {
    id  = module.rds.this_db_instance_id
    arn = module.rds.this_db_instance_arn
  }
}

/*
// Route53 outputs
*/

/*
output "route53" {
  value = {
    record = {
      id   = aws_route53_record.record.id
      name = aws_route53_record.record.name
    },
    zone = {
      id   = aws_route53_zone.primary_zone.id
      name = aws_route53_zone.primary_zone.name
    }
  }
}
*/

/*
// SNS outputs
*/

output "sns" {
  value = {
    id  = aws_sns_topic.sns_topic.id
    arn = aws_sns_topic.sns_topic.arn
  }
}

/*
// S3 outputs
*/

output "s3" {
  value = {
    id  = module.s3.this_s3_bucket_id
    arn = module.s3.this_s3_bucket_arn
  }
}

/*
// VPC outputs
*/

output "vpc" {
  value = {
    id  = module.vpc.vpc_id
    arn = module.vpc.vpc_arn
    private_subnets = {
      ids  = module.vpc.private_subnets
      arns = module.vpc.private_subnet_arns
    }
    public_subnets = {
      ids  = module.vpc.public_subnets
      arns = module.vpc.public_subnet_arns
    }
  }
}
