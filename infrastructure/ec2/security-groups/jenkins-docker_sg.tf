module "security_group_jenkins_docker" {
  source = "../../../modules/ec2/security-groups/jenkins-docker"

  security_group_name        = "jenkins-docker"
  security_group_description = "Security group for the Jenkins Docker instances"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr_block             = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
}