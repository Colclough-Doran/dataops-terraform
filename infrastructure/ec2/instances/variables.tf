variable "aws_profile" {}
variable "aws_region" {}
variable "environment" {}


### Jenkins Instances

variable "instance_ami_id_jenkins_docker" {
  default     = "ami-0de864d6a3bd20ea8"
  description = "The ID of the AMI used to create the Jenkins Docker instance"
  type        = string
}

variable "instance_name_jenkins_docker" {
  default     = "jenkins-docker"
  description = "The name of the Jenkins Docker instance"
  type        = string
}

variable "instance_type_jenkins_docker" {
  default     = "c7i-flex.large"
  description = "The instance type"
  type        = string
}

# Jenkins Instances Tags

variable "instance_os_jenkins_docker_tag" {
  default     = "Linux"
  description = "The instance operating system"
  type        = string
}

variable "instance_purpose_jenkins_docker_tag" {
  default     = "Jenkins-Docker"
  description = "The instance purpose"
  type        = string
}

variable "instance_role_jenkins_docker_tag" {
  default     = "Docker-Host"
  description = "The instance role"
  type        = string
}