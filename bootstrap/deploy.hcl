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

  sha     = "5e34eef04322cc97b2b5b674a2d5ac0c41115136f6829bc140095c2fdd8d98de"
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

  sha     = "h1:wciWfrsgvNJesUIwDq0htbzl3g9aNFbdaAfb22WWH0Y="
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

  sha     = "h1:Na4gdvtqOMaQJ7aY0attdLJ6+BWs4c4Dp2sjXJnM7Hk="
  retries = 1
}
