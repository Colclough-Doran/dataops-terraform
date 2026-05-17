variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "security_group_description" {
  description = "Security group description"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The VPC CIDR block"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC this security group is apart of"
  type        = string
}