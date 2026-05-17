resource "aws_iam_policy" "codebuild_dataops_etl" {
  name        = "codebuild-dataops-etl-service-role"
  description = "Policy for CodeBuild DataOps ETL service"
  policy      = file("policy-files/dataops-etl-service.json")
}