metadata {
  name = "ingress-nginx"
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
  path = "helm/ingress-nginx"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "b8a732c03217142397697584ed29a7d1b17c5c4b308dd96a9edcc5175a54bde7"
    retries = 0
  }
}
