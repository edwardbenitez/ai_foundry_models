variable "rg_prefix" {
  description = "Prefix for the resource group name"
  type        = string
  default     = "dmo"
}
variable "location" {
  description = "resources location"
  default     = "Sweden Central"
}
variable "subscription_id" {
  description = "target subscription id"
}