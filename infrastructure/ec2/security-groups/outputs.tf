output "ecs_id" {
  value = module.security_group_ecs.security_group_id
}

output "eks_worker_node_id" {
  value = module.security_group_eks_woker_node.security_group_id
}

output "jenkins_docker_id" {
  value = module.security_group_jenkins_docker.security_group_id
}