terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.1"
    }
  }
}

provider "http" {}

data "http" "ip" {
  url = "https://api.ipify.org?format=json"
}

output "my_public_ip" {
  value = jsondecode(data.http.ip.response_body).ip
}
