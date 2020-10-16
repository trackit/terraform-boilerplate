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



/*
// CodeBuild outputs
*/



/*
// CodeCommit outputs
*/



/*
// CodeDeploy outputs
*/



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
