package terraform
import input.tfplan as plan

deny[reason] {
  input.variables["service_ports"].hcl == true
  web_port := input.variables["service_ports"].value["web"]
  web_port == 180
  reason := "Web port 180 is not allowed."
}
