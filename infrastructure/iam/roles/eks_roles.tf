module "iam_role_eks_cluster" {
  source = "../../../modules/iam/roles"

  aws_service = "eks"
  iam_policy_name = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]
  iam_role_name = "dataops-eks-cluster"
}

module "iam_role_eks_worker_node" {
  source = "../../../modules/iam/roles"

  aws_service = "ec2"
  iam_policy_name = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
  iam_role_name             = "dataops-eks-worker-node"
  instance_profile_required = true
}