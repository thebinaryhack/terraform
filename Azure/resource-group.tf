resource "azurerm_resource_group" "az_dev_rg" {
  name     = "az_dev_rg"
  location = "Canada Central"
  tags = {
    Environment = "dev"
  }
}