# Create a virtual network
resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  address_space       = ["${var.vnet1_address_space}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

# Create a frontend subnet
# "depends_on" arg is a workaround to avoid conflict with updating NSG rules 
resource "azurerm_subnet" "frontend" {
  name                      = "frontend"
  resource_group_name       = "${var.resource_group_name}"
  virtual_network_name      = "${azurerm_virtual_network.vnet1.name}"
  address_prefix            = "${var.vnet1_frontend_address_prefix}"
  network_security_group_id = "${azurerm_network_security_group.frontend.id}"

  depends_on = [
    "azurerm_network_security_rule.fe_web80",
    "azurerm_network_security_rule.fe_web443",
    "azurerm_network_security_rule.fe_ssh",
    "azurerm_network_security_rule.fe_denyinternet",
  ]
}

# Create a backend subnet
# "depends_on" arg is a workaround to avoid conflict with updating NSG rules 
resource "azurerm_subnet" "backend" {
  name                      = "backend"
  resource_group_name       = "${var.resource_group_name}"
  virtual_network_name      = "${azurerm_virtual_network.vnet1.name}"
  address_prefix            = "${var.vnet1_backend_address_prefix}"
  network_security_group_id = "${azurerm_network_security_group.backend.id}"

  depends_on = [
    "azurerm_network_security_rule.be_denyinternet",
  ]
}
