provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "project07" {
  name = "S2-RG-Project07"
  location = "westeurope"
}
