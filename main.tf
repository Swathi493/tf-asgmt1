
data "azurerm_client_config" "Current" {}
resource "azurerm_data_factory" "dev" {
  name                = var.data_factory_name
  resource_group_name = var.rsgrp
  location            = var.location
   #checkov:skip=CKV_AZURE_104
  tags = var.tags
}

resource "azurerm_databricks_workspace" "dev" {
   name                = var.data_bricks_name
  resource_group_name = var.rsgrp
  location            = var.location
   sku                 = "standard"
  
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
   #checkov:skip=CPY_1: tags not supported for this resource
  
}
resource "azurerm_network_security_group" "secure_terraform_nsg" {
  name                = "secureNetworkSecurityGroup"
  location            = var.location
  resource_group_name = var.rsgrp
}
resource "azurerm_subnet_network_security_group_association" "secure_terraform_nsg_subnet_association" {
  subnet_id                 = azurerm_subnet.dev.id
  network_security_group_id = azurerm_network_security_group.secure_terraform_nsg.id
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
  location                     = var.location
  administrator_login          = var.admin
  administrator_login_password = random_password.password.result
  tags = var.tags
  version                      = "12.0"
  
  minimum_tls_version          = "1.2"

}
resource "azurerm_mssql_database" "dev" {
  name           = var.sqldbname
  server_id      = azurerm_mssql_server.dev.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  sku_name = "Basic"
  #checkov:skip=CPY_1 : tags not supported for this resource
}

  


