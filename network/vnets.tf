# Create a virtual network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  address_space       = ["${var.vnet1_address_space}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  subnet {
    name           = "vet1_frontend"
    address_prefix = "${var.vnet1_frontend_address_prefix}"
    security_group = "${azurerm_network_security_group.frontend.id}"
  }
  
  subnet {
    name           = "vet1_backend"
    address_prefix = "${var.vnet1_backend_address_prefix}"
    security_group = "${azurerm_network_security_group.backend.id}"
  }
  
}
