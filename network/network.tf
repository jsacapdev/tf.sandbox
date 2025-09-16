resource "azurerm_virtual_network" "vnet" {

  name                = var.virtual_network_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = ["10.56.52.0/25"]
}

resource "azurerm_subnet" "apim_subnet" {
  name = var.apim_subnet_name

  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name

  address_prefixes = ["10.56.52.112/28"]
}

resource "azurerm_subnet_network_security_group_association" "apim_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.apim_subnet.id
  network_security_group_id = azurerm_network_security_group.apim_nsg.id
}
