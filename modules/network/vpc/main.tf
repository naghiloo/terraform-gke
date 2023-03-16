resource "google_compute_network" "vpc" {
  name        = var.name
  description = "VPC Network"

  auto_create_subnetworks = var.auto_create_subnetworks
  project                 = var.project_id
}