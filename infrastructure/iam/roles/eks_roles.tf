module "iam_role_eks_cluster" {
  source = "../../../modules/iam/roles"

  aws_service = "eks"
  iam_policy_name = [
    "AmazonEKSClusterPolicy"
  ]
  iam_role_name = "dataops-eks-cluster"
}

module "iam_role_eks_worker_node" {
  source = "../../../modules/iam/roles"

  aws_service = "ec2"
  iam_policy_name = [
    "AmazonEC2ContainerRegistryReadOnly",
    "AmazonEKS_CNI_Policy",
    "AmazonEKSWorkerNodePolicy",
    "AmazonSSMManagedInstanceCore"
  ]
  iam_role_name             = "dataops-eks-worker-node"
  instance_profile_required = true
}