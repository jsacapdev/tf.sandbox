# deploy/backend.tf

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-shared-01"
    storage_account_name = "sttfshared11"
    container_name       = "tfstate"
    key                  = "api-integration-iac.tfstate"
  }
}