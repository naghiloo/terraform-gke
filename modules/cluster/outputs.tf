output "id" {
  value = google_container_cluster.gke_cluster.id
}

output "name" {
  value = google_container_cluster.gke_cluster.name
}

output "endpoint" {
  value = google_container_cluster.gke_cluster.endpoint
}

output "cluster_ca_certificate" {
  value = google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate
}