terraform {
  backend "s3" {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "ec2/auto-scaling-groups/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}