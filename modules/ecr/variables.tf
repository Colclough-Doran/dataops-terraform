variable "ecr_repository_name" {
  description = "Name of the ERC repository"
  type        = string
}

variable "image_tag_mutability_value" {
  description = "The type of ECR repository"
  type        = string

  validation {
    condition     = contains(["IMMUTABLE", "MUTABLE"], var.image_tag_mutability_value)
    error_message = "Value must be IMMUTABLE or MUTABLE."
  }
}