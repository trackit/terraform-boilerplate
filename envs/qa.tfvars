// -- ACM
// -- ALB
// -- AutoScalling
// -- Backup
// -- Client VPN
// -- CloudTrail
// -- CodeBuild
// -- CodeCommit
// -- CodePipeline
// -- EC2
// -- ECR
// -- EKS
// -- ElastiCache
// -- ElasticSearch
// -- Gitlab Runner
gitlab_public_ssh_key_file = "./gitlab_runner/public_ssh_key"
gitlab_runners_url = "https://gitlab.com/"
gitlab_runner_registration_config = {
  "access_level" : "",
  "description" : "",
  "locked_to_project" : "",
  "maximum_timeout" : "",
  "registration_token" : "6HpZYhi_6gtyy61TaTfx",
  "run_untagged" : "",
  "tag_list" : ""
}
// -- GuardDuty
// -- Lambda
lambda_source = "./lambda_handlers/lambda.py"
lambda_name = "test"
lambda_handler = "lambda.handler_test"
lambda_runtime = "python3.8"
// -- RDS
// -- Route53
// -- VPC
vpc_name = "terraform-boilerplate-qa-vpc"
