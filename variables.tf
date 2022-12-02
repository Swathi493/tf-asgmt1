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
  description = "Name of the azure data factory(DEV)"
}
variable "data_bricks_name" {
  type        = string
  description = "Name of the azure data bricks(DEV)"
}

variable "tags" {
  type = object({
    created_by       = string
    created_for      = string
    
  })
}