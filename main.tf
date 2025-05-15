# Creating name for recource group using random provider declared in providers.tf
# To read more about random_pet metod https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

# Creating resource group with mentioned tags, name and location picked up from variables.tf
resource "azurerm_resource_group" "my_rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
  tags = {
    environment = var.environment
    source      = "Terraform"
    owner       = "IT department"
  }
}
