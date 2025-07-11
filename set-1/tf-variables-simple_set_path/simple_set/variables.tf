variable "environment" {
  type        = string
  default     = "prod" 
  description = "Deployment environment"
  sensitive   = true
}
