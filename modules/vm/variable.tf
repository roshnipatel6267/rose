
variable "location_name" {
  type        = string
  description = "Location of the Virtual Machine"
  default = "southeast Asia"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
  default = "roshni-vm"
}

variable "location" {
  type        = string
  description = "Location of the Virtual Machine"
  default = "southeast Asia"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for VM"
  default = "sa1_test_eic_TejalDave"
}

variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
  default = "Standard_B2s"
}

variable "vm_username" {
  type        = string
  description = "Username for the Virtual Machine"
  default = "ubuntu-user"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach the VM to"
  default = "roshni-subnet"
}
// variables.tf

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default = "roshnistorage"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default = "container-roshni"
}

variable "vm_password" {
  type        = string
  description = "Password for the Virtual Machine"
  default = "Roshni@123eic"
}

variable "ssh_public_key" {
  description = "ssh_public _key value"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUEFlZWXqadOH2PXHp3umZOwV/OHzxdeGoumrJybRh4zlM9iZUxydC6Sc0GLNlOUKeksrrlOwuAOO9hy6itT2LjmI3Lrcy7TsDMaYI80PIzIzonAEaPYbmWFLpgigjlj1UVFsdkg85lRuNfpaznKgHbljFFEXp+X4A7zEqxJbmN3MXH0p8i4/6CSMnQZm486sI0jfmDmd4PYrkFYkdGaZzV2hXrI1/vYZd85GhWWS5m3TFQ4lHMLgZklRMD96qU+KOnN/Rw08xMNzUDNU1+oWGwfPr/HIZ/RSIBJgwbyFgZpzApLn+kOIpt8arNfTDv6h1py0QB0Osx5mPbiZtlbpr roshnipatel@1LC73Z2-Latitude-5400"
  
}
