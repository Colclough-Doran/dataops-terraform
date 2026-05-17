module "asg_eks_worker_nodes_dataops" {
  source = "../../../modules/ec2/auto-scaling-groups/eks"

  # Auto Scaling Groups details

  asg_name             = var.eks_asg_name
  asg_desired_capacity = "1"
  asg_max_size         = "1"
  asg_min_size         = "1"
  lt_name              = "${var.eks_asg_name}_"

  # Ec2 details

  ami_id            = var.eks_ec2_instance_ami_id
  instance_name     = "${var.eks_asg_name}-nodes"
  instance_profile  = data.terraform_remote_state.iam_roles.outputs.eks_worker_node_instance_profile
  instance_type     = var.eks_ec2_instance_type
  security_group_id = data.terraform_remote_state.security_groups.outputs.eks_worker_node_id
  key_pair_name     = data.terraform_remote_state.key_pairs.outputs.eks_worker_node_name

  # Networking

  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  vpc_cidr_block     = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id

  # Eks

  eks_cluster_ca_certificate = data.terraform_remote_state.eks.outputs.cluster_ca_certificate
  eks_cluster_endpoint       = data.terraform_remote_state.eks.outputs.cluster_endpoint
  eks_cluster_name           = data.terraform_remote_state.eks.outputs.cluster_name

  # Schedulers

  scale_down_schedules        = local.scale_down_schedules
  scale_down_desired_capacity = "0"
  scale_down_max_size         = "0"
  scale_down_min_size         = "0"

  scale_up_schedules        = local.scale_up_schedules
  scale_up_desired_capacity = "2"
  scale_up_max_size         = "3"
  scale_up_min_size         = "1"
}