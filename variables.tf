variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "billing_account_name" {
  type        = string
  description = "Account Name for the new subscription"
}

variable "enrollment_account_name" {
  type        = string
  description = "Name of the account enrollment"
}

variable "subscription_alias" {
  type        = string
  default     = "autogenerated_terraform_subscription"
  description = "Alias for the subscription"
}

variable "subscription_name" {
  type        = string
  default     = "autogenerated_terraform_subscription"
  description = "Name for the subscription"
}

variable "dbg_simulate" {
  type        = bool
  default     = true
  description = "DEBUG: simulate creation | default: false | true = simulate creation, false = do not simulate creation"
}
