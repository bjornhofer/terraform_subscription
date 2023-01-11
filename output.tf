output "subscription" {
  value = var.dbg_simulate == true ? data.azurerm_subscription.current[0] : resource.azurerm_subscription.main[0]
}