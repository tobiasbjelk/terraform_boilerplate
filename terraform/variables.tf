variable "env" {
  type = string
  description = "env used to keep a good naming convention between environments so code can be reusable."
}

variable "subscription_id" {
  type = string
  description = "ID of the subscription where resources should be deployed to."
}

variable "tenant_id" {
  type = string
  description = "ID of the tenant which contains the subscriptions that are being deployed to."
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Define your region."

  validation {
    # 'condition' specifies the validation condition.
    # Here, it checks whether the value of 'var.location' is 'westeurope' or 'swedencentral'.
    condition     = contains(["westeurope", "swedencentral"], var.location)
    # 'error_message' specifies the error message to display when the validation fails.
    error_message = "The 'location' variable must be 'westeurope' or 'swedencentral'."
  }
}