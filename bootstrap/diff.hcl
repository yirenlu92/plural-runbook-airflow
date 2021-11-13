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

  sha     = "5e34eef04322cc97b2b5b674a2d5ac0c41115136f6829bc140095c2fdd8d98de"
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

  sha     = "h1:Na4gdvtqOMaQJ7aY0attdLJ6+BWs4c4Dp2sjXJnM7Hk="
  retries = 0
}
