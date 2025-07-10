data "aws_caller_identity" "current" {}

data "aws_eks_cluster_auth" "token" {
  name = module.eks.cluster_name
}
