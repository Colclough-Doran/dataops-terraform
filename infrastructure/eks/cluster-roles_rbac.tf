resource "kubernetes_cluster_role_v1" "eks_cluster_manager" {
  metadata {
    name = "eks-cluster-manager"
  }
  rule {
    api_groups = ["rbac.authorization.k8s.io"]
    resources  = ["clusterroles", "clusterrolebindings"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
}

resource "kubernetes_cluster_role_v1" "eks_debug" {
  metadata {
    name = "eks-debug"
  }
  rule {
    api_groups = [""]
    resources  = ["pods", "pods/log", "pods/exec", "configmaps", "services", "namespaces", "nodes"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "replicasets", "statefulsets"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_v1" "eks_edit" {
  metadata {
    name = "eks-edit"
  }
  rule {
    api_groups = ["", "apps", "batch", "extensions"]
    resources  = ["*"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }
  # Exclude sensitive resources like secrets or RBAC
  rule {
    api_groups = [""]
    resources  = ["secrets", "roles", "rolebindings", "clusterroles", "clusterrolebindings"]
    verbs      = ["get", "list", "watch"] # No create/update/delete
  }
}

resource "kubernetes_cluster_role_v1" "eks_readonly" {
  metadata {
    name = "eks-readonly"
  }
  rule {
    api_groups = [""]
    resources  = ["pods", "configmaps", "services", "namespaces"]
    verbs      = ["get", "list", "watch"]
  }
}