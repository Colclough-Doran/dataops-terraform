output "role_arn" {
  value = aws_iam_role.this.arn
}

output "role_instance_profile" {
  # If var.instance_profile_required == true, create output
  value = var.instance_profile_required ? aws_iam_instance_profile.this[0].name : null
}