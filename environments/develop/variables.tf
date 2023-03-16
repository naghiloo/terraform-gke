# #############################################################################
# Google Variables
# #############################################################################

variable "google_project" {
  type        = string
  description = "The GCP project to use. Override via Terratest"
}

variable "google_creds" {
  type        = string
  description = "The GCP Service Account json key file to use authentication and authorization"
}

variable "google_region" {
  type        = string
  description = "The default GCP region to apply changes"
}


# #############################################################################
# Network Variables
# #############################################################################

variable "vpc_name" {
  type        = string
  description = "VPC network name"
}

variable "auto_create_subnetworks" {
  type        = bool
  default     = false
  description = "Default subnets creation variables"
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "subnet_cidr_block" {
  type = string
  description = "IP range block for subnet"
}

# #############################################################################
# Kubernetes Cluster Variables
# #############################################################################

variable "cluster_name" {
  type        = string
  description = "The name of the Kubernetes cluster. Override via Terratest"
}

variable "cluster_location" {
  type        = string
  description = "The Region/Zone location based on regional or zonal cluster."
}

variable "nodepool_default_name" {
  type        = string
  description = "Default Node Pool name"
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Default machine type to use entire project"
}


# #############################################################################
# Application Variables
# #############################################################################

variable "app_name" {
  type        = string
  description = "Application name to use for kubernetes resources name"
}

variable "app_image" {
  type        = string
  description = "Application docker image"
}

variable "container_port" {
  type = number
  description = "Container port to use as target_port"
}