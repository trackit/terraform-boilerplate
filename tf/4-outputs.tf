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



/*
// ECR outputs
*/



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



/*
// Route53 outputs
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
