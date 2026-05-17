resource "kubernetes_cluster_role_binding_v1" "eks_cluster_admin" {
  metadata {
    name = "cluster-admin"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "User"
    name      = var.admin_profile_arn
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding_v1" "eks_cluster_manager" {
  metadata {
    name = "eks-cluster-manager"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role_v1.eks_cluster_manager.metadata[0].name
  }
  subject {
    kind      = "User"
    name      = var.terraform_temp_user_arn
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding_v1" "eks_debug_binding" {

  metadata {
    name = "eks-debug-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role_v1.eks_debug.metadata[0].name
  }
  subject {
    kind      = "Group"
    name      = "Administrators"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding_v1" "eks_edit_binding" {

  metadata {
    name = "eks-edit-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role_v1.eks_edit.metadata[0].name
  }
  subject {
    kind      = "Group"
    name      = "Administrators"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role_binding_v1" "eks_readonly_binding" {

  metadata {
    name = "eks-readonly-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role_v1.eks_readonly.metadata[0].name
  }
  subject {
    kind      = "Group"
    name      = "Administrators"
    api_group = "rbac.authorization.k8s.io"
  }
}