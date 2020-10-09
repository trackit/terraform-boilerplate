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
// GitlabRunner outputs
*/

output "runner" {
  value = {
    id  = module.runner.runner_sg_id
    arn = module.runner.runner_role_arn
    agent = {
      name = module.runner.runner_agent_role_name
      id   = module.runner.runner_agent_sg_id
      arn  = module.runner.runner_agent_role_arn
    }
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
