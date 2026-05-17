resource "aws_codebuild_project" "this" {
  name = var.project_name

  artifacts {
    type           = var.artifacts_type
    location       = var.artifacts_location
    name           = var.artifacts_name
    namespace_type = var.artifacts_namespace_type
    packaging      = var.artifacts_packaging
  }

  encryption_key = var.encryption_key
  service_role   = var.service_role

  environment {
    compute_type                = var.environment_compute_type
    image                       = var.environment_image
    type                        = var.environment_type
    image_pull_credentials_type = var.environment_image_pull_credentials_type
  }

  logs_config {
    cloudwatch_logs {
      group_name = var.cloudwatch_logs_group_name
    }



    s3_logs {
      location = var.s3_logs_location
      status   = var.s3_logs_status
    }
  }

  source {
    type            = var.source_type
    location        = var.source_location
    git_clone_depth = var.source_git_clone_depth
    buildspec       = var.source_buildspec

    git_submodules_config {
      fetch_submodules = var.source_git_submodules_config_fetch_submodules
    }
  }

}