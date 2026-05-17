terraform {
  backend "s3" {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "s3/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}