variable "iam_group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "policy_arn" {
  description = "The ARN(s) for an IAM policy/policies to be added to the group"
  type        = list(string)
}