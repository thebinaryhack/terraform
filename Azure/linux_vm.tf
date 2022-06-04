resource "azurerm_linux_virtual_machine" "az_dev_linux_vm" {
  name                  = "az_dev_linux_vm"
  resource_group_name   = azurerm_resource_group.az_dev_rg.name
  location              = azurerm_resource_group.az_dev_rg.location
  size                  = "Standard_B1s"
  admin_username        = "thebinaryhack"
  network_interface_ids = [azurerm_network_interface.az_dev_nic.id]

  custom_data = filebase64("custom_data.tpl")

  admin_ssh_key {
    username   = "thebinaryhack"
    public_key = file("~/.ssh/id_rsa.pub") # Path of file on local host.
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"
    version   = "latest"
  }

  provisioner "local exec" {
    command = templatefile("windows-ssh-script.tpl", {
      hostname     = self.public_ip_address, # taken from state file
      user         = "thebinaryhack",
      identityfile = "~/.ssh/id_rsa.pub"
    })
    interpreter = ["Powershell", "-Command"]
    # for linux/mac, interprter = ["bash", "-c"]
  }

  tags {
    Environment = "dev"
  }
}