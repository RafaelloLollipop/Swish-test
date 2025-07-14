locals {
  cluster_name = "swish-play-project"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.37.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.33"

  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

eks_managed_node_groups = {
  default = {
    desired_capacity = 1
    max_capacity     = 3
    min_capacity     = 1

    instance_type = "t3.medium"
    taints        = []
    node_labels = {
      group = "default"
    }
  }

    team-a = {
      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 5
      desired_size   = 1

      taints = [{
        key    = "group"
        value  = "team-a"
        effect = "NO_SCHEDULE"
      }]

      labels = {
        group = "team-a"
      }
    }

    team-b = {
      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 5
      desired_size   = 1

      taints = [{
        key    = "group"
        value  = "team-b"
        effect = "NO_SCHEDULE"
      }]

      labels = {
        group = "team-b"
      }
    }
  }


  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
}

resource "aws_eks_access_entry" "github_actions" {
  cluster_name      = local.cluster_name
  principal_arn     = aws_iam_role.github_actions.arn
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "github_actions" {
  cluster_name  = local.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = aws_iam_role.github_actions.arn

  access_scope {
    type       = "cluster"
  }
}



resource "aws_eks_access_entry" "terraform_provider" {
  cluster_name      = local.cluster_name
  principal_arn     = "arn:aws:iam::350152846698:user/terraform-user"
  kubernetes_groups = []
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "terraform_provider" {
  cluster_name  = local.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = "arn:aws:iam::350152846698:user/terraform-user"

  access_scope {
    type       = "cluster"
  }
}
