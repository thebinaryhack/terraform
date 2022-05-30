resource "azurerm_virtual_network" "az-dev-vnet" {
  name                = "az-dev-vnet"
  resource_group_name = azurerm_resource_group.az_dev_rg.name
  location            = azurerm_resource_group.az_dev_rg.location
  address_space       = ["10.100.0.0/16"]

  tags = {
    Environment = "dev"
  }
}