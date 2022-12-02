
resource "azurerm_data_factory" "dev" {
  name                = var.data_factory_name
  resource_group_name = var.rsgrp
  location            = var.location

  tags = var.tags
}