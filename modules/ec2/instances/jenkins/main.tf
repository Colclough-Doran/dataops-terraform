resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = file("${path.module}/user-data/bootstrap.sh")
  lifecycle {
    ignore_changes = [
      security_groups
    ]
  }

  iam_instance_profile = var.instance_profile
  key_name             = var.key_pair_name
  security_groups      = var.security_groups_ids
  subnet_id            = var.private_subnet_id

  tags = {
    Name               = var.instance_name
    "Operation_System" = var.instance_os_tag
    "Instance_Purpose" = var.instance_purpose_tag
    "Instance_Role"    = var.instance_role_tag
  }
}