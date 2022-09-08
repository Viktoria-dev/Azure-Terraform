resource "azurerm_virtual_network" "dev" {
  name                = var.vnet
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group
}

# resource "azurerm_subnet" "dev" {
#   name                 = var.vnet
#   resource_group_name  = var.resource_group
#   virtual_network_name = var.resource_group
#   address_prefixes     = ["10.0.5.0/24"]
# }

# Create Network Security Group and rule
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = "myNetworkSecurityGroup"
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# resource "azurerm_network_interface" "dev" {
#   name                = "dev-nic"
#   location            = var.location
#   resource_group_name = var.resource_group

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.dev.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

