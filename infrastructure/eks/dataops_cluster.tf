module "eks_cluster_dataops" {
  source = "../../modules/eks"

  aws_region               = var.aws_region
  cluster_name             = "dataops"
  cluster_role_arn         = data.terraform_remote_state.iam_roles.outputs.eks_cluster_arn
  subnet_ids               = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  cluster_access           = local.cluster_access
  worker_node_iam_role_arn = data.terraform_remote_state.iam_roles.outputs.eks_worker_node_arn
}