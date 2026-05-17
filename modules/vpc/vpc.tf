resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  region               = var.aws_region
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}