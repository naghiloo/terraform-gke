output "id" {
  value = google_compute_subnetwork.subnet.id
}

output "name" {
  value = google_compute_subnetwork.subnet.name
}

output "cidr_block" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}