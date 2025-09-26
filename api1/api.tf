resource "azurerm_api_management_api" "configuration_item" {
  name                = "configuration-item"
  resource_group_name = var.apim_resource_group_name
  api_management_name = var.api_management_name
  revision            = "1"
  display_name        = "ConfigurationItem API"
  path                = "configurationitem"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_operation" "get_item" {
  operation_id        = "get-configuration-item"
  api_name            = azurerm_api_management_api.configuration_item.name
  api_management_name = var.api_management_name
  resource_group_name = var.apim_resource_group_name

  display_name = "Get Configuration Item"
  method       = "GET"
  url_template = "/{id}"

  template_parameter {
    name     = "id"
    required = true
    type     = "string"
  }

  response {
    status_code      = 200
    description = "Successful response"
  }
}

resource "azurerm_api_management_api_policy" "configuration_item_policy" {
  api_name            = azurerm_api_management_api.configuration_item.name
  api_management_name = var.api_management_name
  resource_group_name = var.apim_resource_group_name

  xml_content = file("${path.module}/policies/policy_auth.xml")
}

resource "azurerm_api_management_api_operation_policy" "get_item_policy" {
  api_name            = azurerm_api_management_api.configuration_item.name
  api_management_name = var.api_management_name
  resource_group_name = data.azurerm_api_management.int_apim.resource_group_name
  operation_id        = azurerm_api_management_api_operation.get_item.operation_id

  xml_content = file("${path.module}/policies/policy_get_item.xml")
}
