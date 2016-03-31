# Create a network security group
resource "azurerm_network_security_group" "frontend" {
    name = "frontend"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
}

# Create a network security group rule
resource "azurerm_network_security_rule" "fe_web80" {
    name = "fe_web80"
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

resource "azurerm_network_security_rule" "fe_web443" {
    name = "fe_web443"
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

# You should define source address prefix as specific IP, if you can
resource "azurerm_network_security_rule" "fe_ssh" {
    name = "fe_ssh"
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

resource "azurerm_network_security_rule" "fe_denyinternet" {
    name = "fe_denyinternet"
    priority = 300
    direction = "Inbound"
    access = "Deny"
    protocol = "*"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = "Internet"
    destination_address_prefix = "*"
    resource_group_name = "${var.resource_group_name}"
    network_security_group_name = "${azurerm_network_security_group.frontend.name}"
}