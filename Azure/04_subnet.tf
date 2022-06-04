resource "azurerm_subnet" "az_dev_subnet" {
  name                 = "az_dev_subnet"
  resource_group_name  = azurerm_resource_group.az_dev_rg.name
  virtual_network_name = azurerm_virtual_network.az_dev_vnet.name
  address_prefix       = ["10.100.0.0/24"]
}