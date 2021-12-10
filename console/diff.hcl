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

  sha     = "864c5426316dbc84ffece59947ce2c61bc46cdeda39e2b768685ff369e819e29"
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

  sha     = "h1:vrUSNzIarGGH5vK0WQJu7zmAo9oy6JHJ3S97HNaPHXU="
  retries = 0
}
