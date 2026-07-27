# Visual Plan array-diff test bed (SCALRCORE-38284).
# Uses only the built-in terraform_data resource, so no provider credentials
# are needed and every change below is a genuine Terraform plan diff.

terraform {
  required_version = ">= 1.5"
}

# CASE 1 (CLOUD-4942) — set(string): re-sorted, one added, one removed, one changed in place.
resource "terraform_data" "allowed_cidrs" {
  input = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "172.16.0.0/16",
    "172.17.0.0/16",
    "192.168.10.0/24",
    "192.168.11.0/24",
    "198.51.100.0/24",
    "203.0.113.0/24",
  ]
}

# CASE 2 (CLOUD-5026) — set of named blocks: add + remove + nested in-place change,
# all falling in the same gap. Identity pairing must be by `name`.
resource "terraform_data" "firewall_rules" {
  input = [
    {
      name        = "allow-db"
      action      = "allow"
      protocol    = "tcp"
      ports       = [5432]
      description = "Postgres from app tier"
    },
    {
      name        = "allow-http"
      action      = "allow"
      protocol    = "tcp"
      ports       = [80, 443]
      description = "Public web traffic"
    },
    {
      name        = "allow-metrics"
      action      = "allow"
      protocol    = "tcp"
      ports       = [9090, 9100]
      description = "Prometheus scrape"
    },
    {
      name        = "allow-ssh"
      action      = "allow"
      protocol    = "tcp"
      ports       = [22]
      description = "Bastion access"
    },
    {
      name        = "deny-telnet"
      action      = "deny"
      protocol    = "tcp"
      ports       = [23]
      description = "Legacy protocol"
    },
  ]
}

# CASE 3 (CLOUD-5277) — pure re-ordering, no value changes.
resource "terraform_data" "tags" {
  input = [
    "billing:platform",
    "compliance:soc2",
    "env:production",
    "owner:core-infra",
    "tier:backend",
  ]
}

# CASE 4 — large array (2500 entries) that must fall back to the value-based diff.
resource "terraform_data" "large_address_pool" {
  input = flatten([
    for a in range(50) : [
      for b in range(50) : format("10.%d.%d.0/24", a, b)
    ]
  ])
}
