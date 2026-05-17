# PRIVATE SUBNETS
resource "aws_subnet" "private" {
  for_each = toset(var.vpc_subnet_azs)

  availability_zone = each.key
  region            = var.aws_region
  cidr_block        = lookup(var.subnet_cidr_block, "private-subnet-${each.key}")
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = "private-subnet-${each.key}"
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public" {
  for_each = toset(var.vpc_subnet_azs)

  availability_zone = each.key
  region            = var.aws_region
  cidr_block        = lookup(var.subnet_cidr_block, "public-subnet-${each.key}")
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = "public-subnet-${each.key}"
  }
} 