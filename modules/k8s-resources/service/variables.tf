variable "name" {
  type = string
  description = "Service name"
}

variable "type" {
  type = string
  default = "ClusterIP"
  description = "Service type"
}

variable "port_name" {
  type = string
  default = null
  description = "Service port name"
}

variable "port" {
  type = number
  description = "Service port number"
}

variable "target_port" {
  type = number
  description = "Container port number"
}