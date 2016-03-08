# Define variables. Credentials and identifiers are loaded from terraform.tfvars
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "prefix" {}
variable "location" {
    default = "Japan West"
}


# Configure the Azure Resource Manager Provider
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Create a resource group
resource "azurerm_resource_group" "terraform_sample" {
    name     = "terraform_sample"
    location = "${var.location}"
}

# Create a virtual network
module "network" {
  source = "./network"
  resource_group_name = "${azurerm_resource_group.terraform_sample.name}"
  location = "${var.location}"
}

# Create a storage
module "storage" {
  source = "./storage"
  resource_group_name = "${azurerm_resource_group.terraform_sample.name}"
  location = "${var.location}"
  prefix = "${var.prefix}"
}

# Create an avalability set
module "avalability_set" {
  source = "./availability_set"
  resource_group_name = "${azurerm_resource_group.terraform_sample.name}"
  location = "${var.location}"
}
