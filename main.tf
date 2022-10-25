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

resource "azurerm_mssql_server" "project07" {
  name                         = "sqlserverproject07x679e6e9"
  resource_group_name          = azurerm_resource_group.project07.name
  location                     = azurerm_resource_group.project07.location
  version                      = "12.0"
  administrator_login          = "admindba"
  administrator_login_password = "ABCabc123.42"
}

resource "azurerm_sql_database" "project07" {
  name                = "dba42"
  resource_group_name = azurerm_resource_group.project07.name
  location            = azurerm_resource_group.project07.location
  server_name         = azurerm_mssql_server.project07.name
}
