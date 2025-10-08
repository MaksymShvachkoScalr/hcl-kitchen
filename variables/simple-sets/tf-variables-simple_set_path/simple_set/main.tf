resource "null_resource" "example" {
  triggers = {
    env = var.token
  }

  provisioner "local-exec" {
    command = "echo Running in environment with token: ${var.token}"
  }
}

output "environment" {
  value = var.token
}
