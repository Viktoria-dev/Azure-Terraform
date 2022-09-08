# Module for networking
module "network_dev" {
  source         = "./modules/az_network"
  resource_group = module.rg_dev.resource_group_name
  location       = module.rg_dev.location
  network_interface_ids = [
    module.subnet_dev.azurerm_network_interface
  ]
}

module "rg_dev" {
  source = "./modules/az_rg"
}

module "subnet_dev" {
  source = "./modules/az_subnet"
  resource_group = module.rg_dev.resource_group_name
  location       = module.rg_dev.location
  network_interface_ids = [
    module.subnet_dev.azurerm_network_interface
  ]
}

module "vm_dev" {
  source         = "./modules/az_vm"
  resource_group = module.rg_dev.resource_group_name
  location       = module.rg_dev.location
  network_interface_ids = [
    module.subnet_dev.azurerm_network_interface
  ]
}