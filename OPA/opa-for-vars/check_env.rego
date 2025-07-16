package terraform
import input.tfplan as plan

default deny = []
default warn = []

deny[reason] {
  input.variables["environment"].value == "prod"
  reason := "Use of 'prod' environment is not allowed."
}

warn[reason] {
  input.variables["environment"].value == "staging"
  reason := "Using 'staging' environment is discouraged."
}
