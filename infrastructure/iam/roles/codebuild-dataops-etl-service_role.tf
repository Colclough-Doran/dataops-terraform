module "iam_role_cb_dataops_etl_service" {
  source = "../../../modules/iam/roles"

  aws_service = "codebuild"
  iam_policy_name = [
    "codebuild-dataops-etl-service-role-default",
    "CodeBuildBasePolicy-dataops-etl-eu-west-1",
    "CodeBuildCloudWatchLogsPolicy-dataops-etl-eu-west-1",
    "CodeBuildCodeConnectionsSourceCredentialsPolicy-dataops-etl-eu-west-1-804792415489"
  ]
  iam_role_name = "codebuild-dataops-etl-service"
}