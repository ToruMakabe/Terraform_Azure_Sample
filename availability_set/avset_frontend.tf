resource "azurerm_availability_set" "avset_frontend" {
    name = "avset_frontend"
    location = "${var.location}"
    resource_group_name = "${var.resource_group_name}"

    tags {
        environment = "terraform_sample"
    }
}
