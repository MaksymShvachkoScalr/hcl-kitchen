include {
  path = find_in_parent_folders("backend.hcl")
}

terraform {
  source = "../main.tf"
}



inputs = {
  module_name = "module-d"
  resource_id = "resource-D-004"
}
