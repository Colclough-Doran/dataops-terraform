module "iam_group_administrators" {
  source = "../../../modules/iam/groups"

  iam_group_name = "Administrators"
  policy_arn = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    data.terraform_remote_state.iam_policies.outputs.eks_admin_access_arn
  ]
}