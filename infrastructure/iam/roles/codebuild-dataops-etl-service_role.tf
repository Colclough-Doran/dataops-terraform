module "iam_role_cb_dataops_etl_service" {
  source = "../../../modules/iam/roles"

  aws_service = "codebuild"
  iam_policy_name = [
    data.terraform_remote_state.iam_policies.outputs.codebuild_dataops_etl_service_arn
  ]
  iam_role_name = "codebuild-dataops-etl-service"
}