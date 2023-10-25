terraform {
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }
}

provider "azurerm" {
	features{
    }
}

module "compute" {
  source	 	              = "./modules/compute"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  virtual_network_name    = var.virtual_network_name
  subnet_name             = var.subnet_name
  public_ip_name          = var.public_ip_name
  nic_name                = var.nic_name
  network_security_group  = var.network_security_group
  ip_configuration_name   = var.ip_configuration_name
  private_ip_allocation   = var.private_ip_allocation
  virtual_machine_name    = var.virtual_machine_name
  virtual_machine_size    = var.virtual_machine_size
}

output"public_ip"{
  value = module.compute.ip
}

resource "local_file" "ip"{
  content  = module.compute.ip
  filename = "./ip.txt"
}

resource "null_resource" "nullremote1" {
  depends_on = [local_file.ip]
  connection {
    type        = "ssh"
    user        = "azureuser" 
    private_key = file("./jsb_key.pem")
    host        = "20.151.74.129"
  }

provisioner "file" {
    source      = "./ip.txt"
    destination = "/home/azureuser/ansible_terraform/azurerm_linux_virtual_machine/ip.txt"
    }
}

resource "random_integer" "trigger" {
  depends_on = [null_resource.nullremote1]
  keepers = {
    always_run = "${timestamp()}"
  }
  min     = 1
  max     = 10000
}

resource "null_resource" "nullremote2" {
  depends_on = [random_integer.trigger]
  triggers = {
    always_run = "${random_integer.trigger.result}"
  }
  connection {
    type        = "ssh"
    user        = "azureuser" 
    private_key = file("./jsb_key.pem")
    host        = "20.151.74.129"

  }
provisioner "remote-exec" {
 inline = [
 "cd /home/azureuser/ansible_terraform/azurerm_linux_virtual_machine/",
 "ansible-playbook instance.yml"
]
}
}
