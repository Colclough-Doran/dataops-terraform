# https://github.com/Colclough-Doran/dataops-terraform/tree/main/infrastructure/eks
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "eks/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}

# https://github.com/Colclough-Doran/dataops-terraform/tree/main/infrastructure/iam/roles
data "terraform_remote_state" "iam_roles" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "iam/roles/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}

# https://github.com/Colclough-Doran/dataops-terraform/tree/main/infrastructure/ec2/key-pairs
data "terraform_remote_state" "key_pairs" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "ec2/key-pairs/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}

# https://github.com/Colclough-Doran/dataops-terraform/tree/main/infrastructure/ec2/security-groups
data "terraform_remote_state" "security_groups" {
  backend = "s3"
  config = {
    bucket  = "dataops-sandbox-infrastructure"
    key     = "ec2/security-groups/terraform.tfstate"
    region  = "eu-west-1"
    profile = "sandbox"
  }
}

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