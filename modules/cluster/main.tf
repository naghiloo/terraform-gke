# Create the GKE cluster
resource "google_container_cluster" "gke_cluster" {
  name        = var.name
  description = var.description
  project     = var.project_id

  # If you specify a zone, the cluster will be a zonal cluster with a single cluster master. 
  # If you specify a region, the cluster will be a regional cluster with multiple masters spread across zones in the region, 
  # and with default node locations in those zones as well
  location       = var.location
  node_locations = var.node_locations

  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count

  # Use the VPC network and subnet created earlier
  network    = var.network
  subnetwork = var.subnetwork

  addons_config {
    http_load_balancing {
      disabled = var.disable_http_load_balancing
    }
    horizontal_pod_autoscaling {
      disabled = var.disable_horizontal_pod_autoscaling
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  # Specify the release channel and version for the cluster
  release_channel {
    channel = var.release_channel
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}


# Create kubeconfig file
data "google_client_config" "default" {}

data "template_file" "kubeconfig" {
  template = file("${path.module}/templates/kubeconfig.tpl")

  vars = {
    cluster_name           = var.name
    cluster_endpoint       = "https://${google_container_cluster.gke_cluster.endpoint}"
    cluster_ca_certificate = google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate
    access_token           = data.google_client_config.default.access_token
  }
}

resource "local_file" "kubeconfig" {
  content  = data.template_file.kubeconfig.rendered
  filename = "kubeconfig"
}
