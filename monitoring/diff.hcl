metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:MxNks8G2hZRT3kMqsaDruqc4svE3lh4SAWaQ7pu48/U="
  retries = 0
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "monitoring",
  ]

  sha     = "f6e0b6cd8bdbbb23eee90e0af9390d98f463c4dfaecd92f3d05c06397ec89c64"
  retries = 0
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:QCo7gnKgrvaMqn9khVbJ2nTd5kBDk2Nm/tsNpYSHSFs="
  retries = 0
}
