variable "location" {
}

variable "resource_group_name" {
}

variable "vnet1_address_space" {
  default = "10.0.0.0/16"
}

variable "vnet1_frontend_address_prefix" {
  default = "10.0.1.0/24"
}

variable "vnet1_backend_address_prefix" {
  default = "10.0.2.0/24"
}
