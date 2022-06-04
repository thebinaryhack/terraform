resource "azurerm_network_interface" "az_dev_nic" {
  name                = "az_dev_nic"
  location            = azurerm_resource_group.az_dev_rg.location
  resource_group_name = azurerm_resource_group.az_dev_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.az_dev_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.az_dev_pip.id
  }

  tags = {
    Environment = "dev"
  }
}