module "key_pair_eks_worker_node" {
  source = "../../../modules/ec2/key-pairs"

  environment   = var.environment
  key_pair_name = "dataops-eks-worker-node"
}