terraform {
  backend "s3" {
    bucket = "terraform-boilerplate-qa"
    key    = "terraform.state"
    region = "us-west-2"
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = var.region
}