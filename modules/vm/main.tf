# Create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location_name
  resource_group_name             = var.resource_group_name
  size                            = var.vm_size
  admin_username                  = var.vm_username
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    name  = "resource-owner"
    owner = "roshni-einfochips.com"
  }

  admin_ssh_key {
    username   = var.vm_username
    public_key = file(var.ssh_public_key)
  }

  ssh_keys {
    key_data = file(var.ssh_public_key)
    path     = "/home/${var.vm_username}/.ssh/id_rsa.pub"
  }

  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")

  provisioner "local-exec" {
    command = <<-EOT
      az storage blob upload --account-name ${var.storage_account_name} \
                              --container-name ${var.container_name}  \
                              --name file1.txt \
                              --type block \
                              --content-type "text/plain" \
                              --file ./file1.txt
    EOT
  }
}
