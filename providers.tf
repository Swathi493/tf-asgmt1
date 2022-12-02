terraform {
  backend "azurerm" { 
    resource_group_name  = var.rsgrp
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.state_file_name
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.3.0"
    }
  }
}

provider "databricks" {}
provider "azurerm" {
  features {}
}