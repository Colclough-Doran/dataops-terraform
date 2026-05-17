resource "aws_iam_policy" "eks_admin_access" {
  name        = "eks-admin-access"
  description = "Policy for EKS admin access"
  policy      = file("policy-files/eks-admin-access.json")
}