variable "name" {
  type = string
  description = "NodePool name"
}

variable "cluster" {
  type = string
  description = "NodePool kubernetes cluster to assign"
}

variable "location" {
  type = string
  description = "NodePool region/zone"
}

variable "autoscaling_min_node_count" {
  type = number
  default = 1
  description = "NodePool min node count"
}

variable "autoscaling_max_node_count" {
  type = number
  default = 3
  description = "NodePool max node count"
}

variable "preemtible" {
  type = bool
  default = false
  description = "Finite Compute Engine resources"
}

variable "machine_type" {
  type = string
  description = "NodePool machine type"
}

variable "disk_size_gb" {
  type = number
  default = 10
  description = "Boot disk size on each node"
}

variable "service_account" {
  type = string
  default = null
  description = "Node Config Service Account"
}

variable "labels" {
  type = map(string)
  default = null
  description = "Node Config Labels"
}