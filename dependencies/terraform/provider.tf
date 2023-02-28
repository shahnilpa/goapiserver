provider "azurerm" {
  features {
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "go-test-eastus-tf-rg"
    storage_account_name = "gotesttfstorage"
    container_name       = "terraformstate"
    key                  = "terraform.tfstate"
  }
}
