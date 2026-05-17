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