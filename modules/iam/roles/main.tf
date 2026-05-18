resource "aws_iam_role" "this" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "${var.aws_service}.amazonaws.com"
        }
      }
    ]
  })
  tags = {
    Name : var.iam_role_name
  }
}

resource "aws_iam_instance_profile" "this" {
  # If var.instance_profile_required == false, set count to 0 and skip creation
  count = var.instance_profile_required == true ? 1 : 0

  name = aws_iam_role.this.name
  role = aws_iam_role.this.name

  tags = {
    Name : var.iam_role_name
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.iam_policy_name)

  policy_arn = each.key
  role       = aws_iam_role.this.name
}