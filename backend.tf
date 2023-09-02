terraform {
  backend "azurerm" {
    resource_group_name  = "TF-State"
    storage_account_name = "afdtestsa"
    container_name       = "afd-test-container"
    key                  = "prod.terraform.tfstate"
  }
}
