resource "aws_ecs_task_definition" "default_dataops_etl" {
  family = "default-dataops-etl"

  enable_fault_injection = false
  cpu                    = "1024"
  memory                 = "2048"

  requires_compatibilities = [
    -"FARGATE",
  ]

  task_role_arn      = "arn:aws:iam::804792415489:role/dataops-ecs-task-execution"
  execution_role_arn = "arn:aws:iam::804792415489:role/dataops-ecs-task-execution"

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  container_definitions = jsonencode([
    {
      name  = "Main"
      image = "service-first"

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "test-etl-dataops"
          awslogs-region        = "eu-west-1"
          awslogs-stream-prefix = "ecs-dataops"
        }
      }

      cpu       = 1024
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])


}