<h1 style="text-align: center">Welcome to terraform-boilerplate 👋</h1>
<p>
</p>

> Terraform boilerplate is a repository aiming to help DevOps to deploy infrastructure on AWS

## Terraform

This project is using terraform to deploy infrastructure, you can download it here: https://learn.hashicorp.com/tutorials/terraform/install-cli

## Usage

You can find all the needed variable in the [tf/2-variables.tf](./tf/2-variables.tf) file
and you can add the variable that you want to change in the [envs/qa.tfvars](./envs/qa.tfvars) file.

You can use the following command to deploy:

```sh
$ cd ./tf
$ terraform init
$ terraform plan -var-file ../envs/qa.tfvars
$ terraform apply -var-file ../envs/qa.tfvars
```

and you can destroy you're infrastructure into using this command:

```sh
$ terraform destroy -var-file ../envs/qa.tfvars
```

## Testing

You can find in the [.github/workflows](./.github/workflows) folder different QA that you can run to test with Github:
- [terraform.yml](./.github/workflows/terraform.yml): automatically running on master and PR when you push. This make a terraform init & plan
- [terraform-qa.yml](./.github/workflows/terraform-qa.yml): manually triggered in Github Actions. This make a terraform init, plan, apply & destroy
- [terraform-qa-no-destroy](./.github/workflows/terraform-qa-no-destroy.yml): manually triggered in Github Actions. This make a terraform init, plan & apply
- [terraform-qa-only-destroy](./.github/workflows/terraform-qa-only-destroy.yml): manually triggered in Github Actions. This make a terraform init & destroy

## Services Available

Here are the services that you can deploy using this repository:
- [AWS Route53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)
- [AWS RDS](https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/2.18.0)
- [AWS Backup](https://github.com/cloudposse/terraform-aws-backup/tree/0.4.0)
- [AWS ECR](https://github.com/cloudposse/terraform-aws-ecr/tree/0.21.0)
- [AWS Elasticache](https://github.com/cloudposse/terraform-aws-elasticache-redis/tree/0.25.0)
- [AWS EKS](https://github.com/terraform-aws-modules/terraform-aws-eks/tree/v12.2.0)
- [AWS VPC](https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/v2.55.0)
- [AWS Lambda](https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/v2.55.0)

## Author

👤 **Trackit**

* Website: [trackit.io](www.trackit.io)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_