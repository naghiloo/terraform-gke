variable "account_id" {
  type = string
  description = "Service account ID"
}

variable "display_name" {
  type = string
  description = "Service account display name"
}

variable "disabled" {
  type = bool
  default = false
  description = "Boolean value to set the service account is disabled or not"
}

variable "project" {
  type = string
  default = null
  description = "GCP project"
}