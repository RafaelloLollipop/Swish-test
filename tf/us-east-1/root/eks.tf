locals {
  cluster_name = "swish-play"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = local.cluster_name
  cluster_version = "1.30"

  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.micro"]
      desired_size   = 1
      min_size       = 1
      max_size       = 1
    }
  }

  tags = {
    Environment = "dev"
    Name        = "minimal-eks"
  }
}

output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}
