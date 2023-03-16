variable "name" {
  type = string
  description = "Deployment name"
}

variable "image" {
  type = string
  description = "Container image"
}

variable "container_port" {
  type = number
  default = 80
  description = "Container port"
}

variable "cpu_limit" {
  type = string
  default = null
  description = "CPU resource limit"
}

variable "memory_limit" {
  type = string
  default = null
  description = "Memory resource limit"
}

variable "cpu_request" {
  type = string
  default = null
  description = "CPU resource request"
}

variable "memory_request" {
  type = string
  default = null
  description = "Memory resource request"
}

