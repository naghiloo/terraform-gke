variable "name" {
  type = string
  description = "Subnet name"
}

variable "network" {
  type = string
  description = "Subnet VPC"
}

variable "cidr_block" {
  type = string
  description = "Subnet CIDR block"
}

variable "region" {
  type = string
  description = "Subnet region"
}