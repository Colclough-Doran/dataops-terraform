variable "project_name" {
  description = "The project name"
  type        = string
}

variable "artifacts_location" {
  description = "The s3 bucket location"
  type        = string
  default     = ""
}

variable "artifacts_name" {
  description = "Artifact name"
  type        = string
  default     = ""
}

variable "artifacts_namespace_type" {
  description = "BUILD_ID"
  type        = string
  default     = "NONE"
}

variable "artifacts_packaging" {
  description = "The type of build output artifact to create, NULL or ZIP" # NULL throws an error if artifacts_type = NO_ARTIFACTS
  type        = string
}

variable "artifacts_type" {
  description = "CODEPIPELINE or S3 or NO_ARTIFACTS"
  type        = string
}

variable "encryption_key" {
  description = "KMS key sued to encrypt the build output"
  type        = string
}

variable "service_role" {
  description = "The IAM role that will carry out the build"
  type        = string
}

variable "environment_compute_type" {
  description = "Instane type"
  type        = string
}

variable "environment_image" {
  description = "Instance OS Image"
  type        = string
}

variable "environment_type" {
  description = "Instance OS Type"
  type        = string
}

variable "environment_image_pull_credentials_type" {
  description = "Credentials type the environment uses to pull the image"
  type        = string
}

variable "cloudwatch_logs_group_name" {
  description = "Group name for the CloudWatch logs"
  type        = string
}

variable "s3_logs_location" {
  description = "Bucket ARN"
  type        = string
}

variable "s3_logs_status" {
  description = "Enabled/Disabled"
  type        = string
}

variable "source_type" {
  description = "What source is used for code"
  type        = string
}

variable "source_location" {
  description = "Repo pointer"
  type        = string
}

variable "source_git_clone_depth" {
  description = "Parameter refers to how deep Git go from each starting point"
  type        = number
}

variable "source_buildspec" {
  description = "Location of where the build spec is stored"
  type        = string
}

variable "source_git_submodules_config_fetch_submodules" {
  description = "Use Git submodules"
  type        = bool
}