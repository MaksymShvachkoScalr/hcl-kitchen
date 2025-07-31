resource "null_resource" "example" {
  triggers = {
    env = var.environment
  }

  provisioner "local-exec" {
    command = "echo Running in environment: ${var.environment}"
  }
}

output "service_ports_output" {
  value = var.service_ports
}
