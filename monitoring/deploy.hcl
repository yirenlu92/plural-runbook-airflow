metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:MxNks8G2hZRT3kMqsaDruqc4svE3lh4SAWaQ7pu48/U="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:MxNks8G2hZRT3kMqsaDruqc4svE3lh4SAWaQ7pu48/U="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:MxNks8G2hZRT3kMqsaDruqc4svE3lh4SAWaQ7pu48/U="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "f6e0b6cd8bdbbb23eee90e0af9390d98f463c4dfaecd92f3d05c06397ec89c64"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:J5AzHah/jSRxxWWVHZfhkdF0JrgUWZfnhu3AHMDwk8k="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:QCo7gnKgrvaMqn9khVbJ2nTd5kBDk2Nm/tsNpYSHSFs="
  retries = 1
}
