locals {
  tags = {
    Terraform          = "true"
    Environnment       = var.env
    TerraformWorkspace = terraform.workspace
  }
}
