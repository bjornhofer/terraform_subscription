provider "azurerm" {
  features {}
  alias = "subscription"
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
} 

data "azurerm_billing_enrollment_account_scope" "main" {
  count                   = var.dbg_simulate == true ? 0 : 1
  billing_account_name    = var.billing_account_name
  enrollment_account_name = var.enrollment_account_name
  provider = azurerm.subscription
}

resource "azurerm_subscription" "main" {
  count             = var.dbg_simulate == true ? 0 : 1
  alias             = var.subscription_alias
  subscription_name = var.subscription_name
  billing_scope_id  = data.azurerm_billing_enrollment_account_scope.main[0].id
  provider = azurerm.subscription
}

// DEBUG - Query current subscription, for output values
data "azurerm_subscription" "current" {
  count = var.dbg_simulate == true ? 1 : 0
  provider = azurerm.subscription
}
