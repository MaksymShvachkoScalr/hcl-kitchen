terraform {
  required_version = ">= 0.13, < 0.14"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "1.3.1"
    }
  }
}

provider "random" {}

resource "random_id" "example" {
  byte_length = 8
}

output "example_id" {
  value = random_id.example.hex
}
