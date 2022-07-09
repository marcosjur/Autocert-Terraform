
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
    application_stack {
        python_version = 3.8
    }
    app_command_line = "gunicorn --bind=0.0.0.0 --workers=4 app:app"
  }
  auth_settings {
    enabled = false
  }


}
