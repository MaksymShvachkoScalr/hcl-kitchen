package terraform

import data.terraform.check_env
import data.terraform.check_port

deny[reason] {
  reason := check_env.deny[_]
}

deny[reason] {
  reason := check_port.deny[_]
}

warn[reason] {
  reason := check_env.warn[_]
}