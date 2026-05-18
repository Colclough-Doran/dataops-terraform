terraform {
  backend "s3" {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "iam/users/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}