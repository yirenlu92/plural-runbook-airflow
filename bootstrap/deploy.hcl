metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:woDL5VWOpkQ3jb0pGUT8aNJ2FRreVjsYUG5Z0Kgt+sk="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:woDL5VWOpkQ3jb0pGUT8aNJ2FRreVjsYUG5Z0Kgt+sk="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "c5a75a0b578b9cd2a874cc8aafff79414fa569e944e3195ea0a2bebb276f80ca"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:ZtHpPr9B1ug7QDsyeKwrmO8aHfp3CsGGgvZQ8FTPbDY="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:6ptFR9Hp9cFPZX5Calzz+AY/vozaj0aOSVDEelU5pJE="
  retries = 1
}
