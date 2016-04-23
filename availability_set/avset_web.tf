resource "azurerm_availability_set" "avset_web" {
  name                = "avset_web"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}
