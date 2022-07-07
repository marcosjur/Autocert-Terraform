terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "autocert_rg" {
  name     = "autocert-rg"
  location = "East US 2"
}

resource "azurerm_service_plan" "autocert_sp" {
  name                = "autocert-sp"
  resource_group_name = azurerm_resource_group.autocert_rg.name
  location            = azurerm_resource_group.autocert_rg.location
  os_type             = "Linux"
  sku_name            = "B2"
}

resource "azurerm_linux_web_app" "autocert_as" {
  name                = "autocert-as"
  location            = azurerm_resource_group.autocert_rg.location
  resource_group_name = azurerm_resource_group.autocert_rg.name
  service_plan_id = azurerm_service_plan.autocert_sp.id

  app_settings = {
    "AUTOCERT_TOKEN_EMAIL"   = var.AUTOCERT_TOKEN_EMAIL,
    "AUTOCERT_EMAIL_FROM"    = var.AUTOCERT_EMAIL_FROM,
    "AUTOCERT_EMAIL_SUBJECT" = var.AUTOCERT_EMAIL_SUBJECT,
    "AUTOCERT_API_TOKEN"     = var.AUTOCERT_API_TOKEN
  }

  site_config {
    
  }
}
