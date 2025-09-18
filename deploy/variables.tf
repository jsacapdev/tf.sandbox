variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "resource_group_location" {
  description = "The Azure region where the resource group will be created."
  type        = string
}

variable "api_management_name" {
  description = "The name of Azure API Management."
  type        = string
}

variable "api_management_public_ip" {
  description = "The name of Azure API Management public IP address."
  type        = string
}

variable "network_resource_group_name" {
  description = "The name of the resource group for the networking components."
  type        = string
}

variable "apim_virtual_network_name" {
  description = "The Network Security Group for the API Management traffic."
  type        = string
}

variable "apim_subnet_name" {
  description = "The Subnet name for the API Management subnet."
  type        = string
}

variable "apim_sku" {
  description = "The SKU for the API Management instance"
  type        = string
}
