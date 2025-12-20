variable "subscription_id" {
  type        = string
  description = "AzureサブスクリプションID"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.subscription_id))
    error_message = "有効なGUID形式で指定してください。"
  }
}
