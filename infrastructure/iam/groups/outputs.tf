output "administraotrs" {
  value = module.iam_group_administrators.group_name
}

output "internal_tools" {
  value = module.iam_group_internal_tools.group_name
}