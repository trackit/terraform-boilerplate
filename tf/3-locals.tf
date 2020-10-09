locals {
  tags = merge({
    Terraform          = "true"
    Environnment       = var.env
    TerraformWorkspace = terraform.workspace
  }, var.tags)
}
