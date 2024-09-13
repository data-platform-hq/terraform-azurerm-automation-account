# Azure Automation Account Terraform module
Terraform module for creation Azure Automation Account

## Usage

```hcl
data "azurerm_resource_group" "example" {
  name = "datahq"
}

data "azurerm_log_analytics_workspace" "example" {
  name                = "example"
  resource_group_name = data.azurerm_resource_group.example.name
}

module "automation_account" {
  source = "data-platform-hq/automation-account/azurerm"
  version = "~> 1.0"

  location = "eastus"
  automation_account_name    = "example-name-datahq"
  resource_group             = data.azurerm_resource_group.example.name
  enable_diagnostic_setting  = true
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.example.id
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_automation_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_account) | resource |
| [azurerm_automation_module.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/automation_module) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytics_destination_type"></a> [analytics\_destination\_type](#input\_analytics\_destination\_type) | Log analytics destination type | `string` | `"Dedicated"` | no |
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | Specifies the name of the Automation account resource | `string` | n/a | yes |
| <a name="input_automation_modules"></a> [automation\_modules](#input\_automation\_modules) | Map of automation modules | <pre>list(object({<br>    name = string<br>    uri  = string<br>  }))</pre> | `[]` | no |
| <a name="input_diagnostic_settings_name"></a> [diagnostic\_settings\_name](#input\_diagnostic\_settings\_name) | Name for Diagnostic Settings that monitors Automation Account | `string` | `null` | no |
| <a name="input_enable_diagnostic_setting"></a> [enable\_diagnostic\_setting](#input\_enable\_diagnostic\_setting) | Enable diagnostic setting; var.analytics\_workspace\_id have to be provided | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log Analytics Workspace ID | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for the automation account | `bool` | `false` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The name of the resource group | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the account. Possible values are Basic and Free | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Automation Account. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity of the Automation Account. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the Automation Account. |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Resource group of Automation Account. |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-automation-account/blob/main/LICENSE)
