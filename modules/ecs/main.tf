resource "aws_ecs_cluster" "this" {
  name = var.ecs_cluster_name

  configuration {
    execute_command_configuration {
      kms_key_id = var.kms_key_id
      logging    = var.configuration_execute_command_configuration_logging
    }
  }

  setting {
    name  = var.setting_name
    value = var.setting_value
  }
}