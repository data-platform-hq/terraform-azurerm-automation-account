resource "azurerm_automation_account" "this" {
  name                          = var.automation_account_name
  location                      = var.location
  resource_group_name           = var.resource_group
  sku_name                      = var.sku
  tags                          = var.tags
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_automation_module" "this" {
  for_each = {
    for i in var.automation_modules : (i.name) => i.uri  if i.name != null
  }

  name                    = each.key
  resource_group_name     = var.resource_group
  automation_account_name = azurerm_automation_account.this.name

  module_link {
    uri = each.value
  }
}
