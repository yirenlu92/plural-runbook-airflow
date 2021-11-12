metadata {
  name = "console"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/console"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "78c92a9eea5b8e1445b53879a3a9e3b1f3f6b88a00d5ef5af65f2c87f210f706"
    retries = 0
  }
}
