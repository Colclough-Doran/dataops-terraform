resource "aws_iam_policy" "github_cicd" {
  name        = "github-cicd"
  description = "Policy for the GitHub CICD user access"
  policy = templatefile("policy-files/github-cicd.json", {
    aws_account_id = data.aws_caller_identity.current.account_id
    aws_region     = var.aws_region
  })
}