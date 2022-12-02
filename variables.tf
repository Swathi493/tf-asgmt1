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

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account, It has to be unique"
}

variable "container_name" {
  type        = string
  description = "Name of the container"
}

variable "state_file_name" {
  type        = string
  description = "Name of the Terraform statefile"
}

variable "data_factory_name" {
  type        = string
  description = "Name of the azure data factory(DEV)"
}
variable "tags" {
  type = object({
    created_by       = string
    created_for      = string
    management_group = string
  })
}