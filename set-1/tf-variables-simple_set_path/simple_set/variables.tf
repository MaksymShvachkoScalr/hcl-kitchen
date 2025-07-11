variable "environment" {
  type        = string
  value       = "prod" 
  description = "Deployment environment"
  sensitive   = true
}
