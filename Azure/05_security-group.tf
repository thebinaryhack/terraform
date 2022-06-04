resource "azurerm_network_security_group" "az_dev_nsg" {
  name                = "az_dev_nsg"
  location            = azurerm_resource_group.az_dev_rg.location
  resource_group_name = azurerm_resource_group.az_dev_rg.name

  tags = {
    Environment = "dev"
  }
}

resource "azurerm_network_security_rule" "az_dev_nsg_rule_001" {
  name                        = "az_dev_nsg_rule_001"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.10.10.10/32" # Replace with your public IP
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.az_dev_rg.name
  network_security_group_name = azurerm_network_security_group.az_dev_nsg.name
}


# Associate with the subnet
resource "azurerm_subnet_network_security_group_association" "az_sn_nsg_integration" {
  subnet_id                 = azurerm_subnet.az_dev_subnet.id
  network_security_group_id = azurerm_network_security_group.az_dev_nsg.id
}