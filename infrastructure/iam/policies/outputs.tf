output "codebuild_dataops_etl_service_arn" {
  value = aws_iam_policy.codebuild_dataops_etl.arn
}

output "codebuild_dataops_etl_service_name" {
  value = aws_iam_policy.codebuild_dataops_etl.name
}

output "eks_admin_access_arn" {
  value = aws_iam_policy.eks_admin_access.arn
}

output "eks_admin_access_name" {
  value = aws_iam_policy.eks_admin_access.name
}