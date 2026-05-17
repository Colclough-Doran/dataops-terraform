resource "aws_ecs_service" "dataops_etl" {
  name            = "dataops-etl"
  cluster         = module.aws_ecs_cluster_dataops.cluster_arn
  task_definition = "default-dataops-etl:3"
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
      "sg-0ff4fa902b9f384ce"
    ]
    subnets = [
      "subnet-0215fc807eb20db5b",
      "subnet-03b4b4ca6287c6036",
      "subnet-03e2e73a401a6c600",
      "subnet-09b5ad37d03f44549",
      "subnet-0ae9e7157feed0909",
      "subnet-0dd84ec37eec2460b"
    ]
  }

}