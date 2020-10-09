# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/2.15.0

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.15.0"

  name           = var.ec2_name
  instance_count = var.ec2_instance_count

  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_key_name
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform          = "true"
    Environment        = var.env
    TerraformWorkspace = terraform.workspace
  }
}
