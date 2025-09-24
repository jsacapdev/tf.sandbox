data "azurerm_resource_group" "network_rg" {
  name = var.network_resource_group_name
}

data "azurerm_virtual_network" "network_apim_vnet" {
  name                = var.apim_virtual_network_name
  resource_group_name = data.azurerm_resource_group.network_rg.name
}

data "azurerm_subnet" "network_apim_vnet_subnet" {
  name                 = var.apim_subnet_name
  virtual_network_name = data.azurerm_virtual_network.network_apim_vnet.name
  resource_group_name  = data.azurerm_resource_group.network_rg.name
}

resource "azurerm_api_management" "int_apim" {
  name                = var.api_management_name

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  publisher_name      = "Plops"
  publisher_email     = "me.dat@plops.net"

  sku_name            = var.apim_sku

  public_ip_address_id = azurerm_public_ip.apim_public_pip.id

  virtual_network_configuration {
    subnet_id = data.azurerm_subnet.network_apim_vnet_subnet.id
  }

  virtual_network_type = "Internal"
}

