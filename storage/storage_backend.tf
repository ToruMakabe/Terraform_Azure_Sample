resource "azurerm_storage_account" "sabk01" {
  name                = "${var.prefix}sabk01"
  resource_group_name = "${var.resource_group_name}"

  location     = "${var.location}"
  account_type = "Standard_GRS"

  tags {
    environment = "terraform_sample"
  }
}

resource "azurerm_storage_container" "contbk01" {
  name                  = "vhds"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.sabk01.name}"
  container_access_type = "private"
}
