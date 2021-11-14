metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:L73lQ4hTvVlCbGsnccekeYpYRWreRIHd4x7WqGAEQ4k="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:L73lQ4hTvVlCbGsnccekeYpYRWreRIHd4x7WqGAEQ4k="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "93eb03bb3e6bf7df8945c41c1c837c7002c17cb59b8de98c27ffc46f09fee59e"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:pAWL+hbeo2/fVvxRUI+ySDusRCieXrGW00fsPcVwIg4="
  retries = 0
}
