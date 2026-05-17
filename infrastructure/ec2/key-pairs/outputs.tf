output "eks_worker_node_name" {
  value = module.key_pair_eks_worker_node.key_pair_name
}

output "jenkins_docker_name" {
  value = module.key_pair_jenkins_docker.key_pair_name
}