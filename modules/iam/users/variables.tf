variable "iam_policy" {
  description = "The policy/polices attached to the role"
  type        = list(string)
}

variable "groups" {
  description = "The name of the group(s) the user is attached to"
  type        = list(string)
}

/* variable "kms_key_id" {
  description = "The KMS key used to encrypt the secret"
  type        = string
} */

variable "user_name" {
  description = "The name of the users"
  type        = string
}