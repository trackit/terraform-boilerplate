<h1 style="text-align: center">Welcome to terraform-boilerplate 👋</h1>
<p>
</p>

> Terraform boilerplate is a Trackit repository which is going to help DevOps deploying infrastructure on AWS

## Terraform

This project is using terraform to deploy infrastructure, you can download it here: https://learn.hashicorp.com/tutorials/terraform/install-cli

Here it is the service you can deploy using this repository:
- AWS Route53
- AWS RDS
- AWS Backup
- AWS ECR
- AWS Elasticache
- AWS EKS
- AWS VPC
- AWS Lambda

## Usage

You can find all the needed variable in the `tf/2-variables.tf` file
and you can add the variable that you want to change in the `envs/qa.tfvars` file.

You can use the following command to deploy:

```sh
$ terraform init
$ terraform plan -var-file ../envs/qa.tfvars
$ terraform apply -var-file ../envs/qa.tfvars
```

and you can destroy you're infrastructure into using this command:

```sh
$ terraform destroy -var-file ../envs/qa.tfvars
```

## Author

👤 **Trackit**

* Website: www.trackit.io

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_