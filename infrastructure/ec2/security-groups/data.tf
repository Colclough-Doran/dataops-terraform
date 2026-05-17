# https://github.com/Colclough-Doran/dataops-terraform/tree/main/infrastructure/vpc
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "vpc/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}