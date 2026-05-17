variable "configuration_execute_command_configuration_logging" {
  description = "Type of logging used"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of ECS  cluster"
  type        = string
}

variable "kms_key_id" {
  description = "ID of the KMS key used"
  type        = string
}

variable "setting_name" {
  description = "Setting name"
  type        = string
}

variable "setting_value" {
  description = "Setting value"
  type        = string
}