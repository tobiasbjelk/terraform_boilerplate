# Define a resource of type 'azurerm_resource_group'
# This is an Azure Resource Group, which is a container that holds related resources for an Azure solution.
resource "azurerm_resource_group" "rg" {
  name     = lower("stexample${var.env}") # Set the name of the resource group. The 'lower' function is used to ensure the name is in lowercase. ${var.env} is a variable that represents your environment, like 'DEV', 'PROD', etc.
  location = var.location # Set the Azure region where the resource group should be created.
}

# Define a resource of type 'azurerm_storage_account'
# This is an Azure Storage Account, which is a scalable and secure place for storing, sharing, and managing your data.
resource "azurerm_storage_account" "storage_example" {

  # This 'for_each' loop is used to create a storage account for each specified environment.
  # Here, it checks if the 'var.env' is 'DEV', if true it creates a storage account, else it doesn't create any.
  # Modify this logic if you want to deploy to other environments.
  for_each                 = contains(["DEV"], var.env) ? toset([var.env]) : toset([])

  name                     = lower("stexample${var.env}")  # Set the name of the storage account in lower case.
  resource_group_name      = azurerm_resource_group.rg.name # Use the name of the previously defined resource group.
  location                 = azurerm_resource_group.rg.location # Use the location of the previously defined resource group.
  account_tier             = "Standard" # Set the performance tier of the storage account. 'Standard' is a common choice.
  account_replication_type = "GRS" # Set the replication type. 'GRS' stands for Geo-Redundant Storage, which means your data is copied to a secondary, geographically distant region.

  # Set the metadata tags for the storage account.
  # These tags help in categorizing resources by business needs, organizational structures, or other specifications.
  # The tags here are based on Azure Cloud Adoption Framework (CAF) recommendations.
  # Feel free to adjust them according to your requirements.
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

