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

// Subscription
variable "subscription_base_name" {
  type        = string
  default     = "autogenerated_terraform_subscription"
  description = "Name for the subscription"
}

variable "subscription_name_prefix" {
  type        = string
  default     = "sub"
  description = "Prefix for the subscription"
}

variable "subscription_name_suffix" {
  type        = string
  default     = ""
  description = "Suffix for the subscription"
}

// Billing Account
variable "billing_account_name" {
  type        = string
  default     = ""
  description = "Account Name for the new subscription"
}

variable "enrollment_account_name" {
  type        = string
  default     = ""
  description = "Name of the account enrollment"
}

variable "subscription_alias" {
  type        = string
  default     = "autogenerated_terraform_subscription"
  description = "Alias for the subscription"
}

variable "subscription_create" {
  type        = bool
  default     = true
  description = "create the subscription - default is true - false will use data provider"
}
