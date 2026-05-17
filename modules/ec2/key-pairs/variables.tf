variable "environment" {
  description = "The environment the key pair is created in"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "production"], lower(var.environment))
    error_message = "Environment must be dev, staging, or production."
  }
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
}