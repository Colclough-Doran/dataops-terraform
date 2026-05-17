terraform {
  backend "s3" {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "developer-tools/pipeline/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}