resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_ssm_parameter" "this" {
  name        = "/ec2/${var.key_pair_name}/private"
  description = "Private key for ${var.key_pair_name}"
  type        = "SecureString"
  value       = tls_private_key.this.private_key_pem
  tags = {
    Environment = var.environment
  }
}