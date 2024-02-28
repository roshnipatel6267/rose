# Define the network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location_name
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Define the public IP address
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}-ip"
  location            = var.location_name
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

# Create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location_name
  resource_group_name             = var.resource_group_name
  size                            = var.vm_size
  admin_username                  = var.vm_username
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.nic.id]
  admin_ssh_key {
    username  = "azureuser"
    #public_key = file("~/.ssh/id_rsa.pub")
    #public_key = file("./.ssh/id_rsa.pub")
    public_key = file(var.ssh_public_key_path)
    
  }
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