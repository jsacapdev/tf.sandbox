# Define the required providers and their versions
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.43"
    }
  }
}

# Configure the provider
provider "azurerm" {
  features {}
}