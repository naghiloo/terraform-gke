resource "kubernetes_horizontal_pod_autoscaler" "hpa" {
  metadata {
    name = var.name
  }

  spec {
    max_replicas = var.max_replicas
    min_replicas = var.min_replicas

    scale_target_ref {
      kind = var.target_kind
      name = var.target_name
      api_version = var.target_api_version
    }

    target_cpu_utilization_percentage = var.target_cpu_utilization_percentage
  }
}