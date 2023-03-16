variable "name" {
  type = string
  description = "VPC name"
}

variable "project_id" {
  type = string
  description = "GCP project id"
}

variable "auto_create_subnetworks" {
  type = bool
  default = false
  description = "Default subnets creation"
}