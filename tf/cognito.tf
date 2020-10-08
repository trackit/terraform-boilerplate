module "cognito-user-pool" {
  source  = "lgallard/cognito-user-pool/aws"
  version = "0.6.2"
  # insert the 24 required variables here
  user_pool_name = ""
}