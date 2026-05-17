resource "aws_ecs_task_definition" "default_dataops_etl" {
    family = "default-dataops-etl"
    requires_compatibilities = ["FARGATE"]
    enable_fault_injection = false
    cpu = "1024"
    memory                   = "2048"
    network_mode             = "awsvpc"

     task_role_arn            = "arn:aws:iam::804792415489:role/dataops-ecs-task-execution"
     execution_role_arn       = "arn:aws:iam::804792415489:role/dataops-ecs-task-execution"

      runtime_platform {
          cpu_architecture        = "X86_64"
          operating_system_family = "LINUX"
        }

    container_definitions = jsonencode([
    {
      name      = "Main"
      image     = "804792415489.dkr.ecr.eu-west-1.amazonaws.com/dataops-etl@sha256:ad73673c32c5ef90fbca206d11da1938168ba06dce125878d93859db9dd3a2d8"

    logConfiguration  = {
        logDriver = "awslogs"
        options   = {
            awslogs-group         = "test-etl-dataops"
            awslogs-region        = "eu-west-1"
            awslogs-stream-prefix = "ecs-dataops"
            }
        }

      cpu       = 1024
      
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol = "tcp"
        }
      ]
    }
  ])
}