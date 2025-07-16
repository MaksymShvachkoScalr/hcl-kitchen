package terraform.check_port

deny[reason] {
  input.variables["service_ports"].hcl == true
  input.variables["service_ports"].value["web"] == 180
  reason := "Web port 180 is not allowed."
}