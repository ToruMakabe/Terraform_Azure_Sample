# Create a network security group
resource "azurerm_network_security_group" "frontend" {
    name = "frontend"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
}

# Create a network security group rule
resource "azurerm_network_security_rule" "web80" {
    name = "web80"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "${var.resource_group_name}"
    network_security_group_name = "${azurerm_network_security_group.frontend.name}"
}

resource "azurerm_network_security_rule" "web443" {
    name = "web443"
    priority = 101
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "443"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "${var.resource_group_name}"
    network_security_group_name = "${azurerm_network_security_group.frontend.name}"
}

resource "azurerm_network_security_rule" "ssh" {
    name = "ssh"
    priority = 200
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "${var.resource_group_name}"
    network_security_group_name = "${azurerm_network_security_group.frontend.name}"
}