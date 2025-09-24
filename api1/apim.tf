data "azurerm_api_management" "int_apim" {
  name                = var.api_management_name
  resource_group_name = var.apim_resource_group_name
}
