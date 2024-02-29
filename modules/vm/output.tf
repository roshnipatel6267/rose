output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
/*
output "storage_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}*/

output "ssh_key" {
  value = file("${path.module}/.ssh/id_rsa.pub")
}