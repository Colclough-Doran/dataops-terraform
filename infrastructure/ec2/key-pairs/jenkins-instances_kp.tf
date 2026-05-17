module "key_pair_jenkins_docker" {
  source = "../../../modules/ec2/key-pairs"

  environment   = var.environment
  key_pair_name = "jenkins-docker"
}