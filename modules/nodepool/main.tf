resource "google_container_node_pool" "gke_nodepool" {
  name = var.name
  cluster = var.cluster
  location = var.location
  node_count = 1

  autoscaling {
    min_node_count = var.autoscaling_min_node_count
    max_node_count = var.autoscaling_max_node_count
  }

  node_config {
    preemptible = var.preemtible
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    service_account = var.service_account
    labels = var.labels
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}