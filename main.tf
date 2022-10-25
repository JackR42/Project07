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

# Create FW rule to allow access from own IP address to the SQL Instance
resource "azurerm_sql_firewall_rule" "project07" {
  name                = "FirewallRule1"
  resource_group_name = azurerm_resource_group.project07.name
  server_name         = azurerm_mssql_server.project07.name
  start_ip_address    = "91.205.194.1"
  end_ip_address      = "91.205.194.1"
}
