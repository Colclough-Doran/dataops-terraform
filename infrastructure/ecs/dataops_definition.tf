resource "aws_ecs_task_definition" "default_dataops_etl" {
  family                   = "default-dataops-etl"
  requires_compatibilities = ["FARGATE"]
  enable_fault_injection   = false
  cpu                      = "1024"
  memory                   = "2048"
  network_mode             = "awsvpc"

  execution_role_arn = data.terraform_remote_state.iam_roles.outputs.ecs_dataops_task_execution_arn
  task_role_arn      = data.terraform_remote_state.iam_roles.outputs.ecs_dataops_task_execution_arn

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  #container_definitions = jsondecode(file("definitions/default-dataops-etl.json"))
  container_definitions = jsonencode([
    {
      name  = "Main"
      image = "${var.image}"

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "test-etl-dataops"
          awslogs-region        = "${var.aws_region}"
          awslogs-stream-prefix = "ecs-dataops"
        }
      }

      cpu = 1024

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