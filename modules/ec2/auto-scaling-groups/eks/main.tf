resource "aws_autoscaling_group" "this" {
  name                = var.asg_name
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  desired_capacity    = var.asg_desired_capacity
  vpc_zone_identifier = var.private_subnet_ids

  lifecycle {
    ignore_changes = [
      name
    ]
  }

  launch_template {
    id      = aws_launch_template.eks_worker_node_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.instance_name
    propagate_at_launch = true
  }
  tag {
    key                 = "kubernetes.io/cluster/${var.eks_cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
}

resource "aws_launch_template" "eks_worker_node_lt" {
  name_prefix   = var.lt_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  iam_instance_profile {
    name = var.instance_profile
  }

  user_data = base64encode(templatefile("${path.module}/user-data/bootstrap.sh.tpl", {
    cluster_name     = var.eks_cluster_name
    cluster_endpoint = var.eks_cluster_endpoint
    cluster_ca_cert  = var.eks_cluster_ca_certificate
    cird_block       = var.vpc_cidr_block
  }))


  network_interfaces {
    associate_public_ip_address = false
    security_groups = [
      var.security_group_id
    ]
  }
}

resource "aws_autoscaling_schedule" "scale_down" {
  for_each = var.scale_down_schedules

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }

  scheduled_action_name  = "scale-down-${each.key}"
  min_size               = var.scale_down_min_size
  max_size               = var.scale_down_max_size
  desired_capacity       = var.scale_down_desired_capacity
  recurrence             = each.value.time
  start_time             = each.value.start_time
  time_zone              = var.time_zone
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_autoscaling_schedule" "scale_up" {
  for_each = var.scale_up_schedules

  lifecycle {
    ignore_changes = [
      start_time
    ]
  }

  scheduled_action_name  = "scale-up-${each.key}"
  min_size               = var.scale_up_min_size
  max_size               = var.scale_up_max_size
  desired_capacity       = var.scale_up_desired_capacity
  recurrence             = each.value.time
  start_time             = each.value.start_time
  time_zone              = var.time_zone
  autoscaling_group_name = aws_autoscaling_group.this.name
}