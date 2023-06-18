output "name" {
  value       = azurerm_automation_account.this.name
  description = "The Name of the Automation Account."
}

output "id" {
  value       = azurerm_automation_account.this.id
  description = "The ID of the Automation Account."
}

output "resource_group" {
  value       = var.resource_group
  description = "Resource group of Automation Account."
}

output "identity" {
  value       = azurerm_automation_account.this.identity[*]
  description = "The identity of the Automation Account."
}
