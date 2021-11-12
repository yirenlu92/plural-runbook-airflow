metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:woDL5VWOpkQ3jb0pGUT8aNJ2FRreVjsYUG5Z0Kgt+sk="
  retries = 0
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:woDL5VWOpkQ3jb0pGUT8aNJ2FRreVjsYUG5Z0Kgt+sk="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "c5a75a0b578b9cd2a874cc8aafff79414fa569e944e3195ea0a2bebb276f80ca"
  retries = 0
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:6ptFR9Hp9cFPZX5Calzz+AY/vozaj0aOSVDEelU5pJE="
  retries = 0
}
