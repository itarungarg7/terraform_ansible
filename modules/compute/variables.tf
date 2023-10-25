variable "resource_group_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the Azure Resource Group"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "public_ip_name" {
  description = "Name for the public IP address"
  type        = string
}

variable "nic_name" {
  description = "Name for the network interface"
  type        = string
}

variable "network_security_group" {
  description = "The name of the network security group"
  type        = string
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration"
  type        = string
}

variable "private_ip_allocation" {
  description = "Private IP address allocation method"
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine"
  type        = string
}

