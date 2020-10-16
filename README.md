<h1 style="text-align: center">Welcome to terraform-boilerplate 👋</h1>
<p>
</p>

> Terraform boilerplate is a repository aiming to help DevOps to deploy infrastructure on AWS

## Terraform

This project is using terraform to deploy infrastructure, you can download it here: https://learn.hashicorp.com/tutorials/terraform/install-cli

Here are the services that you can deploy using this repository:
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

## Testing

You can find in the `.github/workflows` folder different QA that you can run to test with Github:
- `terraform.yml`: automatically running on master and PR when you push. This make a terraform init & plan
- `terraform-qa.yml`: manually triggered in Github Actions. This make a terraform init, plan, apply & destroy
- `terraform-qa-no-destroy`: manually triggered in Github Actions. This make a terraform init, plan & apply
- `terraform-qa-only-destroy`: manually triggered in Github Actions. This make a terraform init & destroy

## Author

👤 **Trackit**

* Website: www.trackit.io

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_