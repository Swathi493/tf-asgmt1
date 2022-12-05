variable "rsgrp" {
  type        = string
  description = "Name of the resource group"
  default     = "devops-rg"
}

variable "location" {
  type        = string
  description = "Location for deploying resources"
  default     = "eastus"
}



variable "data_factory_name" {
  type        = string
  description = "Name of the azure data factory"
}
variable "data_bricks_name" {
  type        = string
  description = "Name of the azure data bricks"
}
variable "vn_name" {
  type        = string
  description = "Name of the azure virtual network"
}
variable "sn_name" {
  type        = string
  description = "Name of the azure subnet"
}
variable "sql_server_name" {
  type        = string
  description = "Name of the azure sql server"
}
variable "sqldbname" {
  type        = string
  description = "Name of the azure sql db name"
}
variable "vnet_cidr_prefix" {
  type = string
  description = "This variable defines address space for vnet"
}

variable "subnet1_cidr_prefix" {
  type = string
  description = "This variable defines address space for subnetnet"
}
variable "admin" {
  type = string
  description = "This variable defines admin name for sql"
}


variable "tags" {
  type = object({
    created_by       = string
    created_for      = string
    
  })
}
