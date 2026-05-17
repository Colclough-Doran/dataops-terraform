# https://codeberg.org/codo/dataops-infrastructure/src/branch/main/infrastructure/production/iam/roles
data "terraform_remote_state" "iam_roles" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "iam/roles/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}

# https://codeberg.org/codo/dataops-infrastructure/src/branch/main/infrastructure/production/iam/roles
data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "s3/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}

# https://codeberg.org/codo/dataops-infrastructure/src/branch/main/infrastructure/production/vpc
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "vpc/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}