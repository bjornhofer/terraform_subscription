output "subscription" {
  value = var.subscription_create == false ? data.azurerm_subscription.current[0] : resource.azurerm_subscription.main[0]
}