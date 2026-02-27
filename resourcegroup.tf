#Creating Resource Group:

resource "azurerm_resource_group" "rg" {
  name = "my-rg"
  location = "UK South"
}
