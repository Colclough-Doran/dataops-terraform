module "aws_ecs_cluster_dataops" {
  source = "../../modules/ecs"

  ecs_cluster_name                                    = "dataops"
  kms_key_id                                          = var.kms_key_id
  setting_name                                        = "containerInsights"
  setting_value                                       = "enhanced"
  configuration_execute_command_configuration_logging = "DEFAULT"
}