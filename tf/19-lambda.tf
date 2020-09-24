# https://github.com/terraform-aws-modules/terraform-aws-lambda

resource "aws_iam_role" "lambda" {
  name               = "test-lambda-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "test-lambda-policy"
  description = "A test policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.policy.arn
}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "1.17.0"

  function_name  = var.lambda_name
  description    = var.lambda_desc
  handler        = var.lambda_handler
  runtime        = var.lambda_runtime
  publish        = var.lambda_publish
  lambda_at_edge = var.lambda_at_edge

  source_path = var.lambda_source
  policy      = aws_iam_policy.policy.arn
  lambda_role = aws_iam_role.lambda.arn

  tags = {
    Terraform          = "true"
    Environment        = var.env
    TerraformWorkspace = terraform.workspace
  }

  ##### Store Packages on S3 w/ Lambda Layer #####
  #store_on_s3 = var.lambda_s3_store
  #s3_bucket   = var.lambda_s3_name

  #layers = [
  #  module.lambda_layer_s3.this_lambda_layer_arn,
  #]
  #environment_variables = {
  #  Serverless = "Terraform"
  #}
  ################################################

  ##### Existing Package Stored Locally #####
  #create_package         = var.lambda_create_package
  #local_existing_package = var.lambda_local_package
  ###########################################

  ##### Existing Package Stored in S3 #####
  #create_package      = var.lambda_create_package
  #s3_existing_package = {
  #  bucket = "my-bucket-with-lambda-builds"
  #  key    = aws_s3_bucket_object.my_function.id
  #}
  ##########################################

  ##### Lambda in VPC #####
  #vpc_subnet_ids         = module.vpc.intra_subnets
  #vpc_security_group_ids = [module.vpc.default_security_group_id]
  #attach_network_policy = var.lambda_attach_ntw_policy
  #########################

  ##### Lambda Permissions Triggers #####
  #allowed_triggers = {
  #  APIGatewayAny = {
  #    service = "apigateway"
  #    arn     = var.api_gateway_arn
  #  },
  #  APIGatewayDevPost = {
  #    service    = "apigateway"
  #    source_arn = var.api_gateway_source_arn
  #  },
  #  OneRule = {
  #    principal  = var.lambda_principal
  #    source_arn = var.lambda_rule_source_arn
  #  }
  #}
  #######################################
}

#resource "aws_s3_bucket_object" "my_function" {
#  bucket = var.lambda_s3_bucket
#  key    = "${filemd5(var.lambda_s3_source)}.zip"
#  source = var.lambda_s3_source
#}

#module "lambda_layer_s3" {
#  source = "terraform-aws-modules/lambda/aws"
#  version = "1.17.0"
#
#  create_layer = var.lambda_s3layer
#
#  layer_name          = var.lambda_s3layer_name
#  description         = var.lambda_s3layer_desc
#  compatible_runtimes = var.lambda_s3layer_compatible_runtimes # [ "runtime1", "runtime2", ... ]

#  source_path = var.lambda_s3layer_source

#  store_on_s3 = var.lambda_s3layer_store
#  s3_bucket   = var.lambda_bucket_layer_name
#}

#module "lambda_layer_local" {
#  source = "terraform-aws-modules/lambda/aws"
#  version = "1.17.0"
#
#  create_layer = var.lambda_layer

#  layer_name          = var.lambda_layer_name
#  description         = var.lambda_layer_desc
#  compatible_runtimes = var.lambda_layer_compatible_runtimes # [ "runtime1", "runtime2", ... ]

#  source_path = var.lambda_layer_source
#}

