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

provider "kubernetes" {
  host                   = module.eks_cluster_dataops.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster_dataops.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks", "get-token", "--cluster-name", module.eks_cluster_dataops.cluster_name
    ]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster_dataops.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster_dataops.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks", "get-token", "--cluster-name", module.eks_cluster_dataops.cluster_name
      ]
    }
  }
}