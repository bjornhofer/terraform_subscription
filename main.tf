provider "azurerm" {
  features {}
  alias           = "subscription"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

data "azurerm_billing_enrollment_account_scope" "main" {
  count                   = var.subscription_create == true ? 1 : 0
  billing_account_name    = var.billing_account_name
  enrollment_account_name = var.enrollment_account_name
  provider                = azurerm.subscription
}

locals {
  subscription_name = length(var.subscription_name_suffix) > 0 ? "${var.subscription_name_prefix}-${var.subscription_name_suffix}" : var.subscription_name_prefix
}

resource "azurerm_subscription" "main" {
  count             = var.subscription_create == true ? 1 : 0
  alias             = var.subscription_alias
  subscription_name = local.subscription_name
  billing_scope_id  = data.azurerm_billing_enrollment_account_scope.main[0].id
  provider          = azurerm.subscription
}

data "azurerm_subscription" "current" {
  count    = var.subscription_create == false ? 1 : 0
  provider = azurerm.subscription
}
