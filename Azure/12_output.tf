output "public_ip_address" {
  value = "${azurerm_linux_virtual_machine.az_dev_linux_vm.name}: ${data.azurerm_public_ip.az_dev_pip-data.ip_address}"
}