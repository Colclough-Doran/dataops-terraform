resource "aws_ecs_service" "dataops_etl" {
  name            = "dataops-etl"
  cluster         = module.aws_ecs_cluster_dataops.cluster_arn
  task_definition = aws_ecs_task_definition.default_dataops_etl.arn
  desired_count   = 1

  availability_zone_rebalancing = "ENABLED"
  enable_ecs_managed_tags       = true
  enable_execute_command        = true
  platform_version              = "LATEST"
  force_new_deployment          = true

  capacity_provider_strategy {
    base              = 0
    capacity_provider = "FARGATE"
    weight            = 1
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_configuration {
    bake_time_in_minutes = "0"
    strategy             = "ROLLING"
  }

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      data.terraform_remote_state.security_groups.outputs.ecs_id
    ]
    subnets = [
      data.terraform_remote_state.vpc.outputs.public_subnet_a_id,
      data.terraform_remote_state.vpc.outputs.public_subnet_b_id,
      data.terraform_remote_state.vpc.outputs.public_subnet_c_id,
      data.terraform_remote_state.vpc.outputs.private_subnet_a_id,
      data.terraform_remote_state.vpc.outputs.private_subnet_b_id,
      data.terraform_remote_state.vpc.outputs.private_subnet_c_id
    ]
  }

}