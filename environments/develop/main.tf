# #############################################################################
# Network Configuration
# #############################################################################

module "vpc_main" {
  source = "../../modules/network/vpc"

  name       = var.vpc_name
  project_id = var.google_project
}

module "subnet_main" {
  source = "../../modules/network/subnet"

  name = var.subnet_name
  network = module.vpc_main.id
  cidr_block = var.subnet_cidr_block
  region = var.google_region
}


# #############################################################################
# Service Account Setup
# #############################################################################

module "gke_service_account" {
  source = "../../modules/service-account"

  account_id = "gke-sa"
  display_name = "GKE Service Account"
}

module "service_account_role_binding" {
  source = "../../modules/role-binding"

  project_id      = var.google_project
  service_account = module.gke_service_account.email

  roles = [
    "roles/logging.logWriter",        # This allows the nodes to write logs to Cloud Logging
    "roles/monitoring.metricWriter",  # This allows the nodes to send monitoring metrics to Cloud Monitoring
    "roles/monitoring.viewer",        # This allows the nodes to view monitoring metrics in Cloud Monitoring
  ]
}


# #############################################################################
# GKE Setup
# #############################################################################

module "gke_cluster" {
  source = "../../modules/cluster"

  name       = var.cluster_name
  project_id = var.google_project
  location   = var.cluster_location

  # kubernetes vpc and subnet configuration
  network    = module.vpc_main.id
  subnetwork = module.subnet_main.id

  disable_http_load_balancing        = true
  disable_horizontal_pod_autoscaling = false
}

module "gke_nodepool_default" {
  source = "../../modules/nodepool"

  name     = var.nodepool_default_name
  cluster  = module.gke_cluster.id
  location = "${var.google_region}-a"

  machine_type = var.machine_type

  service_account = module.gke_service_account.email
}


# #############################################################################
# Kubernetes Resources
# #############################################################################

module "hello-world-deployment" {
  source = "../../modules/k8s-resources/deployment"

  name           = var.app_name
  image          = var.app_image
  container_port = var.container_port

  depends_on = [
    module.gke_nodepool_default
  ]
}

module "hello-world-service" {
  source = "../../modules/k8s-resources/service"

  name        = var.app_name
  type        = "LoadBalancer"
  port_name   = "http"
  port        = var.container_port
  target_port = var.container_port

  depends_on = [
    module.gke_nodepool_default
  ]
}

module "hello-world-hpa" {
  source = "../../modules/k8s-resources/hpa"

  name         = var.app_name
  # min_replicas = 1
  max_replicas = 10

  target_kind                       = "Deployment"
  target_name                       = module.hello-world-deployment.name
  target_api_version                = "apps/v1"
  target_cpu_utilization_percentage = 50
}