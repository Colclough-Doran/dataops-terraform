output "codebuild_dataops_etl_service_arn" {
  value = aws_iam_policy.codebuild_dataops_etl.arn
}

output "eks_admin_access_arn" {
  value = aws_iam_policy.eks_admin_access.arn
}