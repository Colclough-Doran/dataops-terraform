module "iam_user_github_cicd" {
  source = "../../../modules/iam/users"

  user_name = "github-cicd"
  groups = [
    data.terraform_remote_state.iam_groups.outputs.internal_tools
  ]

  iam_policy = [
    data.terraform_remote_state.iam_policies.outputs.github_cicd_arn
  ]
}