resource "local_file" "kubeconfig" {
  filename = "kubeconfig_${var.cluster_name}.yaml"
  content  = <<-EOT
    apiVersion: v1
    clusters:
    - cluster:
        certificate-authority-data: ${aws_eks_cluster.this.certificate_authority[0].data}
        server: ${aws_eks_cluster.this.endpoint}
      name: ${var.cluster_name}
    contexts:
    - context:
        cluster: ${var.cluster_name}
        user: ${var.cluster_name}
      name: ${var.cluster_name}
    current-context: ${var.cluster_name}
    kind: Config
    preferences: {}
    users:
    - name: ${var.cluster_name}
      user:
        exec:
          apiVersion: client.authentication.k8s.io/v1beta1
          command: aws
          args:
            - eks
            - get-token
            - --cluster-name
            - ${var.cluster_name}
  EOT
}