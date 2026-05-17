resource "aws_iam_group" "this" {
  name = var.iam_group_name
}

resource "aws_iam_group_policy_attachment" "this" {
  for_each   = toset(var.policy_arn)
  group      = aws_iam_group.this.name
  policy_arn = each.key
}