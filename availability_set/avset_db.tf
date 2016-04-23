resource "azurerm_availability_set" "avset_db" {
  name                = "avset_db"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}
