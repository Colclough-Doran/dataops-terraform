module "dataops_vpc" {
  source = "../../modules/vpc"

  aws_region        = var.aws_region
  environment       = var.environment
  subnet_cidr_block = var.subnet_cidr_block
  vpc_cidr_block    = var.vpc_cidr_block
  vpc_subnet_azs    = var.vpc_subnet_azs
}