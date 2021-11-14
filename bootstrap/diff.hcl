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

  sha     = "a9f8012d6834cbd168fab2f8d55067bb7d66b08474c9afabda3981982be62e62"
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

  sha     = "h1:mDf9+AWqmIqiwG0Ku+jK2gyCSqVJf0NFjqPPVSiypzQ="
  retries = 0
}
