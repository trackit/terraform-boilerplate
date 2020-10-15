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
