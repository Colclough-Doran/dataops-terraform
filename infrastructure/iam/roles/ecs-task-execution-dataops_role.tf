module "iam_role_dataops_ecs_task_execution" {
  source = "../../../modules/iam/roles"

  aws_service = "ecs-tasks"
  iam_policy_name = [
    data.terraform_remote_state.iam_policies.outputs.ecs_task_execution_dataops_arn,
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
  iam_role_name = "dataops-ecs-task-execution"
}