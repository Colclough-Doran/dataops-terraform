moved {
  from = aws_codebuild_project.dataops_etl
  to = module.codebuild_project_dataops.aws_codebuild_project.this
}

module "codebuild_project_dataops" {
  source = "../../../modules/developer-tools/code-build"
  project_name = "dataops-etl"

  artifacts_location = "dataops-eu-west-1"
  artifacts_name = "dataops-etl"
  artifacts_packaging = "ZIP"
  artifacts_type = "S3"
  artifacts_namespace_type = "BUILD_ID"

  encryption_key = "arn:aws:kms:eu-west-1:804792415489:alias/aws/s3"
  service_role = "arn:aws:iam::804792415489:role/service-role/codebuild-dataops-etl-service-role"

  environment_compute_type = "BUILD_GENERAL1_MEDIUM"
  environment_image = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
  environment_type = "LINUX_CONTAINER"
  environment_image_pull_credentials_type = "CODEBUILD"

  cloudwatch_logs_group_name = "dataops-etl"

  s3_logs_location = "arn:aws:s3:::dataops-eu-west-1"
  s3_logs_status = "ENABLED"

  source_buildspec = file("buildspec/dataops-etl.yaml")
  source_git_clone_depth = 1
  source_location = "https://github.com/Colclough-Doran/dataops-etl.git"
  source_type = "GITHUB"
  source_git_submodules_config_fetch_submodules = false
}
/* 
resource "aws_codebuild_project" "dataops_etl" {
  name = "dataops-etl"

  artifacts {
    type           = "S3"
    location       = "dataops-eu-west-1"
    name           = "etl"
    namespace_type = "BUILD_ID"
    packaging      = "NONE"
  }

  encryption_key = ""
  service_role   = "arn:aws:iam::804792415489:role/service-role/codebuild-dataops-etl-service-role"

  environment {
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name = "dataops-etl"
    }

    s3_logs {
        location = "arn:aws:s3:::dataops-eu-west-1"
      status   = "ENABLED"
    }
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/Colclough-Doran/dataops-etl.git"
    git_clone_depth = 1
    buildspec       = file("buildspec/dataops-etl.yaml")

    git_submodules_config {
      fetch_submodules = false
    }
  }

} */