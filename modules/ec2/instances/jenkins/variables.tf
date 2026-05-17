# Ec2 instance

variable "ami_id" {
  description = "The AMI used for the creating the EKS worker nodes"
  type        = string
}

variable "key_pair_name" {
  description = "The key pairs used to SSH onto the Ec2 instances"
  type        = string
}

variable "instance_name" {
  description = "Name of the Ec2 instance"
  type        = string
}

variable "instance_purpose_tag" {
  description = "Tag used to indicate the purpose of the Ec2 instance"
  type        = string
}

variable "instance_profile" {
  description = "THe IAM instance profile attached to the Ec2 instance"
  type        = string
}

variable "instance_os_tag" {
  description = "The operating system the Ec2 instance is using"
  type        = string
}

variable "instance_role_tag" {
  description = "Tag used to indicate the role of the Ec2 instance"
  type        = string
}

variable "instance_type" {
  description = "The Ec2 instance type used for the creating the Ec2 isntances"
  type        = string
}

variable "security_groups_ids" {
  description = "Security group ID"
  type        = list(string)
}

# Networking

variable "private_subnet_id" {
  description = "The ID for a Private Subnet in eu-west-1"
  type        = string
}