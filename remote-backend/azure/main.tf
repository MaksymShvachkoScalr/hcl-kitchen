terraform {
  backend "azurerm" {
    resource_group_name  = "scalr-rg2"
    storage_account_name = "state2sub"
    container_name       = "tfstate"
    tenant_id            = var.STATE_TENANT_ID
    client_id            = var.STATE_CLIENT_ID
    client_secret        = var.STATE_CLIENT_SECRET
    subscription_id      = var.STATE_SUBSCRIPTION_ID
    key                  = "${var.SCALR_ENVIRONMENT_NAME}/${var.SCALR_WORKSPACE_NAME}/terraform.tfstate"
    use_msi              = true
  }
}

provider "azurerm" {
  features {}

  use_msi         = true
  subscription_id = var.subscription_id_deploy    # First azure subscription which is for deployment and resources
  tenant_id       = var.tenant_id_deploy         # Azure Entra tenant ID from first subscription
}