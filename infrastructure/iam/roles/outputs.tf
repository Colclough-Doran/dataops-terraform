output "codebuild_dataops_etl_service_arn" {
  value = module.iam_role_cb_dataops_etl_service.role_arn
}

output "ecs_dataops_task_execution_arn" {
  value = module.iam_role_dataops_ecs_task_execution.role_arn
}

output "eks_cluster_arn" {
  value = module.iam_role_eks_cluster.role_arn
}

output "eks_worker_node_arn" {
  value = module.iam_role_eks_worker_node.role_arn
}

output "eks_worker_node_instance_profile" {
  value = module.iam_role_eks_worker_node.role_instance_profile
}

output "jenkins_docker_instance_profile" {
  value = module.iam_role_eks_jenkins_docker.role_instance_profile
}