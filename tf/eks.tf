# https://github.com/terraform-aws-modules/terraform-aws-eks/tree/v12.2.0

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 12.2.0"

  cluster_name       = var.eks_cluster_name
  cluster_version    = "1.16"
  subnets            = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
  manage_aws_auth    = true
  config_output_path = "kubeconfig_${var.eks_cluster_name}-${var.env}"

  worker_groups = [
    {
      instance_type = var.eks_instance_type
      asg_max_size  = var.eks_asg_max_size
      asg_min_size  = var.eks_asg_min_size
    }
  ]

  tags = local.tags
}
