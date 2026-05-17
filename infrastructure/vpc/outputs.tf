# Public Subnet outputs

output "public_subnet_a_id" {
  value = module.dataops_vpc.public_subnet_a_id
}

output "public_subnet_b_id" {
  value = module.dataops_vpc.public_subnet_b_id
}

output "public_subnet_c_id" {
  value = module.dataops_vpc.public_subnet_c_id
}

# Private Subnet outputs

output "private_subnet_ids" {
  value = module.dataops_vpc.private_subnet_ids
}

output "private_subnet_a_id" {
  value = module.dataops_vpc.private_subnet_a_id
}

output "private_subnet_b_id" {
  value = module.dataops_vpc.private_subnet_b_id
}

output "private_subnet_c_id" {
  value = module.dataops_vpc.private_subnet_c_id
}

# VPC outputs

output "vpc_id" {
  value = module.dataops_vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.dataops_vpc.vpc_cidr_block
}