resource "google_compute_subnetwork" "subnet" {
  name        = var.name
  description = "The Public subnet To bringing K8s cluster up in that"
  network     = var.network

  ip_cidr_range = var.cidr_block
  region        = var.region
}