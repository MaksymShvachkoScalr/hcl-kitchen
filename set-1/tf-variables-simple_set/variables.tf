variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "service_ports" {
  type = map(number)
  description = "Map of service names to their ports"
}
