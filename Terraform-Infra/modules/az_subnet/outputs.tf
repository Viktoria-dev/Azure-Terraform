# output "resource_group_name" {
#   value = azurerm_resource_group.dev.name
# }

# output "location" {
#   value = azurerm_resource_group.dev.location
# }

output "azurerm_network_interface" {
  value = azurerm_network_interface.dev.id
}