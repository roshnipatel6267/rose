output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
/*
output "storage_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}*/

output "ssh_public_key" {
  value = data.azurerm_ssh_public_key.public_key.openssh_key
}