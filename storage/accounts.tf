resource "azurerm_storage_account" "sa01" {
    name = "${var.prefix}sa01"
    resource_group_name = "${var.resource_group_name}"

    location = "${var.location}"
    account_type = "Standard_GRS"

    tags {
        environment = "terraform_sample"
    }
}

resource "azurerm_storage_container" "cont01" {
    name = "vhds"
    resource_group_name =  "${var.resource_group_name}"
    storage_account_name = "${azurerm_storage_account.sa01.name}"
    container_access_type = "private"
}
