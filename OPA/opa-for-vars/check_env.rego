package terraform.check_env

warn[reason] {
  input.variables["environment"].value == "staging"
  reason := "Environment 'staging' should be used with caution."
}

deny[reason] {
  input.variables["environment"].value == "prod"
  reason := "Environment 'prod' is forbidden."
}