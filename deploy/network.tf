resource "azurerm_public_ip" "apim_public_pip" {
  name                = var.api_management_public_ip

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"
  sku                 = "Standard"

  domain_name_label   = var.api_management_name
}