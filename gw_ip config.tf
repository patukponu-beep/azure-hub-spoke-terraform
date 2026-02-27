#CREATING TWO GATEWAY PUBLIC IPS:

resource "azurerm_public_ip" "gw_pip1" {
  name                = "vnet-gw-pip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1","2","3"]

}


resource "azurerm_public_ip" "gw_pip2" {
  name                = "vnet-gw-pip2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1","2","3"]

}