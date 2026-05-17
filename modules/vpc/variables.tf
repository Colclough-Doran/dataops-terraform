

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "The environment the VPC is created in"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "production"], lower(var.environment))
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "igw_name" {
  description = "Name of the Internet gateway"
  default     = "dataops-igw"
  type        = string
}

variable "ngw_name" {
  description = "Name of the NAT gateway"
  default     = "dataops-ngw"
  type        = string
}

variable "subnet_cidr_block" {
  type = map(string)
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  default = "dataops"
  type    = string
}

variable "vpc_subnet_azs" {
  type = list(string)
}