module "security_group_eks_woker_node" {
  source = "../../../modules/ec2/security-groups/eks-woker-node"

  security_group_name        = "dataops-eks-worker-node"
  security_group_description = "Security group for the Dataops EKS worker nodes"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr_block             = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
}