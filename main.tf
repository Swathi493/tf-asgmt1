
resource "azurerm_data_factory" "dev" {
  name                = var.data_factory_name
  resource_group_name = var.rsgrp
  location            = var.location

  tags = var.tags
}

resource "azurerm_databricks_workspace" "dev" {
   name                = var.data_bricks_name
  resource_group_name = var.rsgrp
  location            = var.location
  sku                 = "standard"
  tags= var.tags
}
resource "azurerm_virtual_network" "dev" {
  name                = var.vn_name
  address_space       = ["${var.vnet_cidr_prefix}"]
  location            = var.location
  resource_group_name = var.rsgrp
  tags = var.tags
}

resource "azurerm_subnet" "dev" {
  name                 = var.sn_name
  resource_group_name  = var.rsgrp
  virtual_network_name = azurerm_virtual_network.dev.name
  address_prefixes     = ["${var.subnet1_cidr_prefix}"]
  service_endpoints    = ["Microsoft.Sql"]
  
}
resource "random_password" "password" {
  length           = 8
  lower            = true
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
  numeric          = true
  override_special = "_"
  special          = true
  upper            = true
}

resource "azurerm_mssql_server" "dev" {
  name                         = var.sql_server_name
  resource_group_name          = var.rsgrp
  location                     = var.loca
  administrator_login          = var.admin
  administrator_login_password = random_password.password.result
  tags = var.tags
  
  

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  ssl_enforcement_enabled      = true

}

resource "azurerm_mssql_virtual_network_rule" "dev" {
  name      = var.mssql_vnrule_name
  
  subnet_id = azurerm_subnet.dev.id
  tags = var.tags

  
  resource_group_name = var.rsgrp
  server_name         = azurerm_mysql_server.dev.name
  
}