terraform {
  required_version = "~> 1.3.7"

  required_providers {
    google = {
      version = "~> 4.57.0"
    }

    kubernetes = {
      version = "~> 2.18.1"
    }
  }

  # backend "gcs" {
  #   bucket = "backend-develop"
  #   prefix = "terraform/state"
  # }
}


provider "google" {
  project     = var.google_project
  region      = var.google_region
  
  # Use this item instead of exporting GOOGLE_APPLICATION_CREDENTIALS variable
  # credentials = file(var.google_creds)
}

data "google_client_config" "default" {}
provider "kubernetes" {
  host                   = "https://${module.gke_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke_cluster.cluster_ca_certificate)

  # Also you can connect to your kubernetes cluster using kubeconfig file
  # context_name = "gke_${var.google_project}_${var.google_region}_${module.gke_develop.name}"
  # config_path  = "./kubeconfig"
}