resource "azurerm_resource_group" "rg" {
  name     = lower("stexample${var.env}")
  location = var.location
}

resource "azurerm_storage_account" "storage_example" {

    # example where we define which environments we are deploying the storage account to.
    # During development we maybe only want to deploy it to dev in the beginning of dev cycle.
    # Remove line 11 to remove this logic. 
  for_each                 = contains(["DEV"], var.env) ? toset([var.env]) : toset([])
  name                     = lower("stexample${var.env}") 
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  #Tagging according to Azure CAF abit add or remove to fit your needs. https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging
  tags = {
    WorkloadName       = "servicename${var.env}"
    DataClassification = "Non-business"
    Criticality        = "Low"
    BusinessUnit       = "Shared"
    OpsCommitment      = "Platform"
    OpsTeam            = "Central IT"
    Env                = "${var.env}"
  }
}
