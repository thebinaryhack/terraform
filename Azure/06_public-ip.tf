resource "azurerm_public_ip" "az_dev_pip" {
  name                = "az_dev_pip"
  resource_group_name = azurerm_resource_group.az_dev_rg.name
  location            = azurerm_resource_group.az_dev_rg.location
  allocation_method   = "Static" # Can be dynamic for dev, but preferred static for ease

  tags = {
    Environment = "dev"
  }
}