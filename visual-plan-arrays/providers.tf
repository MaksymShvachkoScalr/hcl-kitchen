# Real-provider array attributes, to check the diff against provider schemas rather
# than only the built-in terraform_data. Both providers apply with no credentials.

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

# CASE 5 — real provider list(string) attribute that forces replacement.
# v1: 8 inputs. Next revision removes one and adds one.
resource "random_shuffle" "regions" {
  input = [
    "ap-south-1",
    "ap-southeast-1",
    "eu-central-1",
    "eu-west-1",
    "sa-east-1",
    "us-east-1",
    "us-east-2",
    "us-west-2",
  ]
  result_count = 4
}

resource "tls_private_key" "demo" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# CASE 6 — real provider list(string) + nested block, changed in place.
resource "tls_self_signed_cert" "demo" {
  private_key_pem = tls_private_key.demo.private_key_pem

  subject {
    common_name  = "visual-plan.example.com"
    organization = "Scalr Test"
  }

  validity_period_hours = 8760

  allowed_uses = [
    "cert_signing",
    "digital_signature",
    "key_encipherment",
    "server_auth",
  ]

  dns_names = [
    "a.visual-plan.example.com",
    "b.visual-plan.example.com",
    "c.visual-plan.example.com",
  ]
}

# CASE 7 (AC 8) — JSON-encoded strings inside a list. The diff normalizes them
# before comparing, so re-formatting or re-ordering keys must be a no-op and only
# a real value change must show.
resource "terraform_data" "iam_policies" {
  input = [
    jsonencode({ Effect = "Allow", Action = "s3:GetObject", Resource = "arn:aws:s3:::bucket-a/*" }),
    jsonencode({ Effect = "Allow", Action = "s3:PutObject", Resource = "arn:aws:s3:::bucket-b/*" }),
    jsonencode({ Effect = "Allow", Action = "sqs:SendMessage", Resource = "arn:aws:sqs:::queue-c" }),
  ]
}

# CASE 8 (AC 8) — array of arrays.
resource "terraform_data" "port_ranges" {
  input = [
    [80, 443],
    [3000, 3999],
    [8080, 8089],
    [9090, 9099],
  ]
}

# CASE 9 (AC 9) — non-array attributes alongside the arrays, to confirm scalar and
# object rendering is untouched by the array work.
resource "terraform_data" "mixed_attributes" {
  input = {
    replicas    = 3
    enabled     = true
    tier        = "backend"
    ratio       = 0.75
    maybe       = null
    nested      = { region = "eu-west-1", zone = "eu-west-1a" }
    single_list = ["only-item"]
  }
}
