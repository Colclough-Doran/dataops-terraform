provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      "Service"       = local.service
      "Terraform-URL" = local.terraform_url
    }
  }
}