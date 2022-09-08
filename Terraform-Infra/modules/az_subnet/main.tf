resource "azurerm_subnet" "dev" {
  name                 = var.vnet
  resource_group_name  = var.resource_group
  virtual_network_name = var.resource_group
  address_prefixes     = ["10.0.5.0/24"]
}

resource "azurerm_network_interface" "dev" {
  name                = "dev-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.dev.id
    private_ip_address_allocation = "Dynamic"
  }
}
