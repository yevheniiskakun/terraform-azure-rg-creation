resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "my_rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
  tags = {
    environment = var.environment
    source      = "Terraform"
    owner       = "IT department"
  }
}