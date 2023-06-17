variable "project" {
  type        = string
  description = "Project name"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "resource_group" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "suffix" {
  type        = string
  description = "Optional suffix that would be added to the end of resources names. It is recommended to use dash at the beginning of variable (e.x., '-example')"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "custom_automation_account_name" {
  type        = string
  description = "Specifies the name of the Automation account resource"
  default     = null
}

variable "sku" {
  type        = string
  description = "The SKU of the account. Possible values are Basic and Free"
  default     = "Basic"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for the automation account"
  default     = false
}

variable "enable_diagnostic_setting" {
  type        = bool
  description = "Enable diagnostic setting; var.analytics_workspace_id have to be provided"
  default     = false
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace ID"
  default     = null
}

variable "custom_diagnostics_name" {
  type        = string
  description = "Custom name for Diagnostic Settings that monitors Automation Account"
  default     = null
}

variable "analytics_destination_type" {
  type        = string
  default     = "Dedicated"
  description = "Log analytics destination type"
}
