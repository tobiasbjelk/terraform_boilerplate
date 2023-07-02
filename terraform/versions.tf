# The 'terraform' block is used to configure high-level behavior of Terraform itself.
terraform {

  # The 'backend' block is used to specify where Terraform should store its state files. 
  # The 'azurerm' backend stores state files on Azure Storage, which is useful for team collaboration and Terraform state file protection.
  backend "azurerm" {}

  # The 'required_providers' block specifies the providers required for this Terraform configuration.
  # Each block inside 'required_providers' specifies a provider.
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" # The 'source' attribute specifies the location of the provider. 
      version = "< 4.0.0" # The 'version' attribute specifies the version constraint for the provider.
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "< 3.0.0"
    }
  }
}

# The 'provider' block is used to configure the named provider, in this case 'azurerm' (Azure Resource Manager).
# The 'azurerm' provider is used to interact with the many resources supported by Azure Resource Manager (AzureRM) through its APIs.
provider "azurerm" {

  # These are credentials used by the 'azurerm' provider to authenticate with Azure.
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id     

  # The 'features' block is used to enable, disable or tweak specific behaviour of certain Azure Resource Manager resources.
  features {

    # The 'key_vault' block is used to control the behaviours of Azure Key Vault.
    key_vault {
      # If 'purge_soft_delete_on_destroy' is set to 'false', when the Key Vault is destroyed it will be soft deleted,
      # allowing you to recover it within the recovery period (by default 90 days).
      purge_soft_delete_on_destroy = false
    }
  }
}

# The 'provider' block for 'azuread' (Azure Active Directory). 
# This provider is used to manage resources in Azure Active Directory.
provider "azuread" {}
