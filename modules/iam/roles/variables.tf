variable "aws_service" {
  description = "Service used in assume role"
  type        = string
}

variable "iam_policy_name" {
  description = "The policy/polices attached to the role"
  type        = list(string)
}

variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "instance_profile_required" {
  description = "Is an instance profile required for this role?"
  type        = bool
  default     = false
}