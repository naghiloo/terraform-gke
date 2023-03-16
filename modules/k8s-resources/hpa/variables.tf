variable "name" {
  type = string
  description = "HPA name"
}

variable "min_replicas" {
  type = number
  default = 1
  description = "HPA min replicas"
}

variable "max_replicas" {
  type = number
  description = "HPA max replicas"
}

variable "target_kind" {
  type = string
  description = "Target resource kind"
}

variable "target_name" {
  type = string
  description = "Target resource name"
}

variable "target_api_version" {
  type = string
  description = "Target API Version"
}

variable "target_cpu_utilization_percentage" {
  type = number
  default = null
  description = "Target CPU Utilization"
}