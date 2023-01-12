from typing import Dict, List, Any

from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class DataBricksSKUCheck(BaseResourceCheck):
    def __init__(self) -> None:
        name = "Data Bricks SKU should be standard"
        id = "AZURE_DB_SKU_CHECK"
        supported_resources = ["azurerm_databricks_workspace"]
        categories = [CheckCategories.CONVENTION]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        
        
           if conf['sku'][0] == "standard":
               return CheckResult.PASSED       
           
        
        
           return CheckResult.FAILED


check =DataBricksSKUCheck()