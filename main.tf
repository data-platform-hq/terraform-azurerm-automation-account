locals {
  suffix                  = length(var.suffix) == 0 ? "" : "-${var.suffix}"
  automation_account_name = var.custom_automation_account_name == null ? "automation-${var.project}-${var.env}-${var.location}${local.suffix}" : "${var.custom_automation_account_name}${local.suffix}"
}

resource "azurerm_automation_account" "this" {
  name                          = local.automation_account_name
  location                      = var.location
  resource_group_name           = var.resource_group
  sku_name                      = var.sku
  tags                          = var.tags
  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = "SystemAssigned"
  }
}
