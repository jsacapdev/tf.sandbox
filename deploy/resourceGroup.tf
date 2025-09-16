module "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.2.1"

  name     = var.resource_group_name
  location = var.resource_group_location

  enable_telemetry = false
}
