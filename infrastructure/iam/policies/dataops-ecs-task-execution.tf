resource "aws_iam_policy" "ecs_task_execution_dataops" {
  name        = "dataops-ecs-task-execution"
  description = "Policy for CodeBuild DataOps ETL service"
  policy = templatefile("policy-files/ecs-task-execution-dataops.json", {
    aws_account_id = data.aws_caller_identity.current.account_id
    aws_region     = var.aws_region
  })
}