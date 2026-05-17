variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "cluster_access" {
  description = "Principal_arn is IAM Role/User ARN, policy_arn is IAM policy ARN, kubernetes_groups is for rbac, access_scope_type type of access"
  type = map(object({
    principal_arn     = string
    policy_arn        = list(string)
    kubernetes_groups = list(string)
    access_scope_type = string
  }))
}

variable "cluster_authentication_mode" {
  default     = "API_AND_CONFIG_MAP"
  description = "The mode of authentication used to access the EKS cluster. CONFIG_MAP, API or API_AND_CONFIG_MAP"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN for the IAM role attached to the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "desired_node_count" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "eks_access_entry_type" {
  default     = "STANDARD"
  description = "The type of access entry"
  type        = string
}

variable "max_node_count" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "min_node_count" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.small"
}

variable "subnet_ids" {
  description = "The subnet IDs the cluster will use"
  type        = list(string)
}

variable "worker_node_iam_role_arn" {
  description = "The ARN for the worker nodes IAM role"
}