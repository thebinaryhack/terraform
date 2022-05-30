resource "azurerm_subnet" "az-dev-subnet" {
  name                 = "az-dev-subnet"
  resource_group_name  = azurerm_resource_group.az_dev_rg.name
  virtual_network_name = azurerm_virtual_network.azurerm_virtual_network.name
  address_prefix       = ["10.100.0.0/24"]
}