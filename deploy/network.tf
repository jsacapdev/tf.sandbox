resource "azurerm_public_ip" "apim_public_pip" {
  name                = var.api_management_public_ip

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"
  sku                 = "Standard"

  domain_name_label   = var.api_management_name
}

resource "azurerm_private_dns_zone" "apim_dns" {
  name                = "privatelink.azure-api.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone" "apim_dns_1" {
  name                = "azure-api.net"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "apim_dns_vnet_link" {
  name                  = "${var.api_management_name}-link"
  resource_group_name   = azurerm_private_dns_zone.apim_dns.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.apim_dns.name
  virtual_network_id    = data.azurerm_virtual_network.network_apim_vnet.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "apim_dns_1_vnet_link" {
  name                  = "${var.api_management_name}-link"
  resource_group_name   = azurerm_private_dns_zone.apim_dns.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.apim_dns_1.name
  virtual_network_id    = data.azurerm_virtual_network.network_apim_vnet.id
}

resource "azurerm_private_dns_a_record" "apim_record" {
  name                = "apim-api-int-westeu-dev-01"   
  zone_name           = azurerm_private_dns_zone.apim_dns.name
  resource_group_name = azurerm_private_dns_zone.apim_dns.resource_group_name
  ttl                 = 300
  records             = ["10.56.52.116"]               
}

resource "azurerm_private_dns_a_record" "apim_record_1" {
  name                = "apim-api-int-westeu-dev-01"   
  zone_name           = azurerm_private_dns_zone.apim_dns_1.name
  resource_group_name = azurerm_private_dns_zone.apim_dns_1.resource_group_name
  ttl                 = 300
  records             = ["10.56.52.116"]               
}
