variable "aws_profile" {}
variable "aws_region" {}
variable "environment" {}

variable "eks_asg_name" {
  default     = "dataops-eks-worker"
  description = "The name of the ASG"
  type        = string
}

variable "eks_ec2_instance_ami_id" {
  default     = "ami-04b74c0facf5e1635"
  description = "The AMI used in creating the EKS worker nodes"
  type        = string
}

variable "eks_ec2_instance_type" {
  default     = "c7i-flex.large"
  description = "The instance type used for the EKS worker nodes"
  type        = string
}