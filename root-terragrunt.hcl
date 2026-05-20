# data

generate "data" {
  path = "data.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
  data "aws_caller_identity" "current" {}
  EOF
}

# locals

generate "locals" {
  path      = "local.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
locals {
  service = "${replace(path_relative_to_include(), "\\", "/")}"
  terraform_url = "https://www.codeberg.com/codo/sandbox-infrastructure/${replace(path_relative_to_include(), "\\", "/")}"
}
EOF
}

# provider

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
    provider "aws" {
    region = "eu-west-1"
    profile = "CoDo - Sandbox"

    default_tags {
    tags = {
      "Service" = local.service
      "Terraform-URL" = local.terraform_url
    }
  }
}
EOF
}

# state

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket  = "codo-sandbox-infrastructure"
    key     = "${replace(path_relative_to_include(), "\\", "/")}/terraform.tfstate"
    region  = "eu-west-1"
    profile = "CoDo - Sandbox"
  }
}
EOF
}