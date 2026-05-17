# Auto scaling group

variable "asg_name" {
  description = "The name for the auto scaling group"
  type        = string
}

variable "asg_desired_capacity" {
  description = "The desired capacity for the auto scaling group"
  type        = string
  default     = 1
}

variable "asg_min_size" {
  description = "The minimum size for the auto scaling group"
  type        = string
  default     = 1
}

variable "asg_max_size" {
  description = "The maximum size for the auto auto scaling group"
  type        = string
  default     = 2
}

variable "lt_name" {
  description = "The of the launche template used in the autoscaling group"
  type        = string
}

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

variable "instance_profile" {
  description = "THe IAM instance profile attached to the Ec2 instance"
  type        = string
}

variable "instance_type" {
  description = "The Ec2 instance type used for the creating the Ec2 isntances"
  type        = string
}

variable "security_group_id" {
  description = "The ID for the EKS worker node security group"
  type        = string
}

# EKS

variable "eks_cluster_ca_certificate" {
  description = "EKS CA certificatet"
  type        = string
}

variable "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

# Scale down scheduler

variable "scale_down_desired_capacity" {
  description = "The desired capacity for the auto schedule scale down"
  type        = string
  default     = 0
}

variable "scale_down_max_size" {
  description = "The maximum size for the auto schedule scale down"
  type        = string
  default     = 0
}

variable "scale_down_min_size" {
  description = "The minimum size for the auto schedule scale down"
  type        = string
  default     = 0
}

variable "scale_down_schedules" {
  description = "The schedules the auto scale down follows"
  type = map(object({
    time       = string
    start_time = string
  }))
}

# Scale up scheduler

variable "scale_up_desired_capacity" {
  description = "The desired capacity for the auto schedule scale up"
  type        = string
  default     = 2
}

variable "scale_up_max_size" {
  description = "The maximum size for the auto schedule scale up"
  type        = string
  default     = 3
}

variable "scale_up_min_size" {
  description = "The minimum size for the auto schedule scale up"
  type        = string
  default     = 1
}

variable "scale_up_schedules" {
  description = "The schedules the auto scale up follows"
  type = map(object({
    time       = string
    start_time = string
  }))
}

# Scheduler 

variable "time_zone" {
  description = "Time zone the ASG is created in"
  type        = string
  default     = "Europe/Dublin"
}

# Networking

variable "private_subnet_ids" {
  description = "The IDs for Private Subnets in eu-west-1"
  type        = list(string)
}

variable "vpc_cidr_block" {
  description = "The CIRD block for VPC"
  type        = string
}

variable "vpc_id" {
  description = "The ID for the VPC"
  type        = string
}