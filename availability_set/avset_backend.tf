resource "azurerm_availability_set" "avset_backend" {
    name = "avset_backend"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
}
