resource "aws_iam_policy" "codebuild_dataops_etl" {
  name        = "codebuild-dataops-etl-service-role"
  description = "Policy for CodeBuild DataOps ETL service"
  policy      = templatefile("policy-files/dataops-etl-service.json", {
    aws_account_id = data.aws_caller_identity.current.account_id
    aws_region     = var.aws_region
  })
}