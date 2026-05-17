module "codebuild_project_dataops" {
  source       = "../../../modules/developer-tools/code-build"
  project_name = var.project_name_dataops

  artifacts_location       = data.terraform_remote_state.s3.outputs.dataops_name
  artifacts_name           = "codebuild-artifacts"
  artifacts_packaging      = "ZIP"
  artifacts_type           = "S3"
  artifacts_namespace_type = "BUILD_ID"

  encryption_key = var.kms_key
  service_role   = data.terraform_remote_state.iam_roles.outputs.codebuild_dataops_etl_service_arn

  environment_compute_type                = "BUILD_GENERAL1_MEDIUM"
  environment_image                       = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
  environment_type                        = "LINUX_CONTAINER"
  environment_image_pull_credentials_type = "CODEBUILD"

  cloudwatch_logs_group_name = "/aws/codebuild/${var.project_name_dataops}"

  s3_logs_location = data.terraform_remote_state.s3.outputs.dataops_arn
  s3_logs_status   = "ENABLED"

  source_buildspec = templatefile("buildspec/dataops-etl.yaml", {
    aws_account_id = data.aws_caller_identity.current.account_id
    aws_region     = var.aws_region
  })

  source_git_clone_depth                        = 1
  source_location                               = "https://github.com/Colclough-Doran/dataops-etl.git"
  source_type                                   = "GITHUB"
  source_git_submodules_config_fetch_submodules = false
}