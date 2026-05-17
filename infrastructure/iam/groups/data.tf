# https://github.com/Colclough-Doran/dataops-terraform/tree/main/infrastructure/iam/policies
data "terraform_remote_state" "iam_policies" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "iam/policies/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}