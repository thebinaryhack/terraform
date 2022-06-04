data "azurerm_public_ip" "az_pip_data" {
  name                = azurerm_public_ip.az_dev_pip.name
  resource_group_name = azurerm_resource_group.az_dev_rg.name
}