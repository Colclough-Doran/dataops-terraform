output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr_block" {
  value = aws_vpc.this.cidr_block
}

# Public Subnet outputs

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "public_subnet_a_id" {
  value = aws_subnet.public["eu-west-1a"].id
}

output "public_subnet_b_id" {
  value = aws_subnet.public["eu-west-1b"].id
}

output "public_subnet_c_id" {
  value = aws_subnet.public["eu-west-1c"].id
}

# Private Subnet outputs

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private : subnet.id]
}

output "private_subnet_a_id" {
  value = aws_subnet.private["eu-west-1a"].id
}

output "private_subnet_b_id" {
  value = aws_subnet.private["eu-west-1b"].id
}

output "private_subnet_c_id" {
  value = aws_subnet.private["eu-west-1c"].id
}