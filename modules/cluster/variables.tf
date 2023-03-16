variable "name" {
  type        = string
  description = "Kubernetes Cluster name"
}

variable "description" {
  type        = string
  default     = ""
  description = "Cluster description"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "location" {
  type        = string
  description = "Controll Plane nodes location (region/zone)"
}

variable "node_locations" {
  type        = list(string)
  default     = null
  description = "Kubernetes Worker nodes location (region/zone)"
}

variable "remove_default_node_pool" {
  type        = bool
  default     = true
  description = ""
}

variable "initial_node_count" {
  type        = number
  default     = 1
  description = "The initial node count to deploy"
}

variable "network" {
  type        = string
  default     = null
  description = "VPC id"
}

variable "subnetwork" {
  type        = string
  default     = null
  description = "Subnet id"
}

variable "disable_http_load_balancing" {
  type        = bool
  default     = true
  description = ""
}

variable "disable_horizontal_pod_autoscaling" {
  type        = bool
  default     = true
  description = "Kubernetes HPA"
}

variable "release_channel" {
  type        = string
  default     = "UNSPECIFIED"
  description = "Kubernetes Controll Plane update sterategy (UNSPECIFIED, RAPID, REGULAR, STABLE)"
}