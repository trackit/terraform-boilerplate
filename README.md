<p align="center">
  <img width="600" height="136" src="https://i.imgur.com/7miBcAA.png">
</p>

<h1 style="text-align: center">👋 Welcome to terraform-boilerplate!</h1>
<p align="center">
    <a href="https://github.com/trackit/terraform-boilerplate/actions">
        <img src="https://github.com/trackit/terraform-boilerplate/workflows/Terraform/badge.svg">
    </a>
    <img src="https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github">
</p>

> Terraform boilerplate is a repository aiming to help DevOps to deploy infrastructure on AWS

This project is using terraform to deploy infrastructure, you can download it here: https://learn.hashicorp.com/tutorials/terraform/install-cli

## 📚 Usage

The project is aimed to be used with `terraform workspace` which is why there is the `envs` directory. Feel free to create new files in this folder to overwrite default variables defined in [tf/2-variables.tf](./tf/2-variables.tf).



[envs/qa.tfvars](./envs/qa.tfvars) is use in our CI/CD pipeline to make sure the code we want to merge can be deployed.


### 🚀 Deploy

```sh
$ cd ./tf
$ terraform init
$ terraform plan -var-file ../envs/qa.tfvars
$ terraform apply -var-file ../envs/qa.tfvars
```

### 💣 Destroy

```sh
$ terraform destroy -var-file ../envs/qa.tfvars
```

## 💻 Testing

You can find in the [.github/workflows](./.github/workflows) folder different QA that you can run to test with Github:
- [terraform.yml](./.github/workflows/terraform.yml): automatically running on master and PR when you push. This make a terraform init & plan
- [terraform-qa.yml](./.github/workflows/terraform-qa.yml): manually triggered in Github Actions. This make a terraform init, plan, apply & destroy
- [terraform-qa-no-destroy](./.github/workflows/terraform-qa-no-destroy.yml): manually triggered in Github Actions. This make a terraform init, plan & apply
- [terraform-qa-only-destroy](./.github/workflows/terraform-qa-only-destroy.yml): manually triggered in Github Actions. This make a terraform init & destroy
- [terraform-everyday-only-destroy](./.github/workflows/terraform-everyday-only-destroy.yml): automatically triggered everyday in Github Actions. This make a terraform init & destroy on all workspaces

## ✅ Services Available

Here are the services that you can deploy using this repository:
- [AWS Route53](./tf/route53.tf)
- [AWS RDS](./tf/rds.tf)
- [AWS Backup](./tf/backup.tf)
- [AWS ECR](./tf/ecr.tf)
- [AWS Elasticache](./tf/elasticache.tf)
- [AWS EKS](./tf/eks.tf)
- [AWS VPC](./tf/vpc.tf)
- [AWS Lambda](./tf/lambda.tf)
- [AWS CloudTrail](./tf/cloudtrail.tf)
- [AWS Cognito](./tf/cognito.tf)
- [AWS ECS](./tf/ecs.tf)
- [AWS SNS](./tf/sns.tf)

## 🤝 Missing a specific feature?

Feel free to ask for the features you want! Our teams will be happy to add them!

## ❤️ Show your support

Give a ⭐️ if this project helped you!

## ✏️ Author

### 👤 Trackit
- Website: [trackit.io](www.trackit.io)

### 👥 About us

We are an Amazon Web Services Advanced Consulting Partner specializing in cloud management, consulting, and software development solutions based in Venice, CA.

