resource "azurerm_service_plan" "autocert_sp" {
  name                = "autocert-sp"
  resource_group_name = azurerm_resource_group.autocert_rg.name
  location            = azurerm_resource_group.autocert_rg.location
  os_type             = "Linux"
  sku_name            = "B2"
}

