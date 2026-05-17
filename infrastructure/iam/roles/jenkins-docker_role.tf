module "iam_role_eks_jenkins_docker" {
  source = "../../../modules/iam/roles"

  aws_service = "ec2"
  iam_policy_name = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
  iam_role_name             = "jenkins-docker"
  instance_profile_required = true
}