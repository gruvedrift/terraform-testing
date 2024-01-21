terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
}

provider "azurerm" {
  features {}
}

// Create resource group
resource "azurerm_resource_group" "gruvedrift" {
  name     = "gruvedriftresourcegrouptmp"
  location = "West Europe"
  tags = {
    environment = "production"
    source      = "github"
    owner       = "locforer"
  }
}

// Create ACR - Azure Container Registry
resource "azurerm_container_registry" "gruvedrift" {
  name                = "gruvedriftcontainerregistrytmp"
  resource_group_name = azurerm_resource_group.gruvedrift.name
  location            = "West Europe"
  sku                 = "Basic"
  admin_enabled       = true
}
