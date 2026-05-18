module "iam_group_internal_tools" {
  source = "../../../modules/iam/groups"

  iam_group_name = "Internal-Tools"
  policy_arn     = []
}