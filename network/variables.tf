variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the resource group will be created."
  type        = string
}

variable "virtual_network_name" {
  description = "The Network Security Group for the API Management traffic."
  type        = string
}

variable "apim_subnet_name" {
  description = "The Subnet name for the API Management subnet."
  type        = string
}

variable "apim_network_security_group" {
  description = "The Network Security Group for the API Management traffic."
  type        = string
}
