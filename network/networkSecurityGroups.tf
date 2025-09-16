resource "azurerm_network_security_group" "apim_nsg" {
  name                = var.apim_network_security_group
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "apim_rule_in_100" {
  name                        = "APIM-Management"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "ApiManagement"
  source_port_range           = "*"
  destination_address_prefix  = "VirtualNetwork"
  destination_port_range      = "3443"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.apim_nsg.name
}

resource "azurerm_network_security_rule" "apim_rule_in_120" {
  name                        = "AllowAzureLoadBalancer"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "AzureLoadBalancer"
  source_port_range           = "*"
  destination_address_prefix  = "10.56.52.112/28" 
  destination_port_range      = "6390"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.apim_nsg.name
}

resource "azurerm_network_security_rule" "apim_rule_out_100" {
  name                        = "AllowKeyVault"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "10.56.52.112/28"
  source_port_range           = "*"
  destination_address_prefix  = "AzureKeyVault"
  destination_port_range      = "443"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.apim_nsg.name
}