locals {
  service       = "eks"
  terraform_url = "https://codeberg.org/codo/dataops-infrastructure/src/branch/main/infrastructure/${local.service}"

  cluster_access = {
    "admin" = {
      principal_arn = var.admin_profile_arn,
      policy_arn = [
        "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy",
        "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminViewPolicy"
      ],
      kubernetes_groups = ["administrators"],
      access_scope_type = "cluster"
    }
    "terraform_temp_user" = {
      principal_arn = var.terraform_temp_user_arn,
      policy_arn = [
        "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      ],
      kubernetes_groups = ["administrators"],
      access_scope_type = "cluster"
    }
  }
}