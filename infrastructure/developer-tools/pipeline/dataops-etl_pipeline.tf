resource "aws_codepipeline" "this" {
  name     = "dataops-etl"
  role_arn = "arn:aws:iam::804792415489:role/service-role/CodePipelineService-dataops-etl" # <--- remote_terraform_state

  execution_mode = "QUEUED"
  pipeline_type  = "V2"

  artifact_store {
    location = data.terraform_remote_state.s3.outputs.dataops_name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "dataops-etl-source"
      namespace        = "SourceVariables"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration = {
        ConnectionArn        = "arn:aws:codeconnections:eu-west-1:804792415489:connection/56c76a03-13aa-4234-b3ce-ec651de4af5c"
        FullRepositoryId     = "Colclough-Doran/dataops-etl"
        BranchName           = "main"
        DetectChanges        = false
        OutputArtifactFormat = "CODEBUILD_CLONE_REF"
      }
    }

    on_failure {
      result = "RETRY"

      retry_configuration {
        retry_mode = "ALL_ACTIONS"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version          = "1"
      namespace        = "BuildVariables"

      configuration = {
        ProjectName = "dataops-etl"
      }
    }

    on_failure {
      result = "RETRY"

      retry_configuration {
        retry_mode = "ALL_ACTIONS"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["BuildArtifact"]
      version         = "1"
      namespace       = "DeployVariables"

      configuration = {
        "ClusterName" = "dataops"
        "ServiceName" = "dataops-etl"
      }
    }

    on_failure {
      result = "ROLLBACK"
    }
  }
}