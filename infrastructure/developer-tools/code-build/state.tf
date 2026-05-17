terraform {
  backend "s3" {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "developer-tools/code-build/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}