resource "aws_iam_user" "this" {
  name = var.user_name
}

resource "aws_iam_user_group_membership" "this" {
  user   = aws_iam_user.this.name
  groups = var.groups
}

resource "aws_iam_user_policy_attachment" "this" {
  for_each = toset(var.iam_policy)

  policy_arn = each.key
  user       = aws_iam_user.this.name
}

/* resource "aws_iam_user_login_profile" "this" {
  user                    = aws_iam_user.this.name
  password_reset_required = true
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_secretsmanager_secret" "this" {
  name        = "/iam/users/${var.user_name}/secret-access-key"
  description = "Access Key ID for ${var.user_name}"
  kms_key_id  = var.kms_key_id
  #aws_iam_access_key.this.secret
} */