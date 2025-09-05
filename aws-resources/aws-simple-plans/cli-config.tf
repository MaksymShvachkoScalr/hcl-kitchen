terraform {
  cloud {
    hostname = "alfiia.scalr.io"
    organization = "env-v0oq7i1ed6r85ua12"

    workspaces {
      name = "cli-cost-estim"
    }
  }
}
