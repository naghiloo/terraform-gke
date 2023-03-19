variable "project_id" {
  type = string
  description = "The GCP project id"
}

variable "service_account" {
  type = string
  description = "The Service Account that binds to role(s)"
}

variable "roles" {
  type = list(string)
  description = "The role that binds to Service Account"
}