variable "SCALR_ENVIRONMENT_NAME" {
  type = string
}

variable "SCALR_WORKSPACE_NAME" {
  type = string
}

variable "subscription_id_deploy" {
  description = "Azure Subscription ID where resources will be created"
  type        = string
}

variable "tenant_id_deploy" {
  description = "Azure AD (Entra ID) tenant ID"
  type        = string
}

variable "STATE_TENANT_ID" {
  description = "Azure AD (Entra ID) tenant ID"
  type        = string
}

variable "STATE_CLIENT_ID" {
  description = "Azure AD (Entra ID) tenant ID"
  type        = string
}

variable "STATE_SUBSCRIPTION_ID" {
  description = "Azure AD (Entra ID) tenant ID"
  type        = string
}

variable "STATE_CLIENT_SECRET" {
  description = "Azure AD (Entra ID) tenant ID"
  type        = string
}