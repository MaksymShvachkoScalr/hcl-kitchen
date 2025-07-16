version = "v2"

policy "check_env" {
  enabled           = true
  enforcement_level = "hard-mandatory"
}

policy "check_port" {
  enabled           = true
  enforcement_level = "soft-mandatory"
}