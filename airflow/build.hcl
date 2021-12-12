metadata {
  name = "airflow"
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
  path = "helm/airflow"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "0c18c367a7c3d9dc87dbafa9fd4af59f94661b3fbd4782b5ab6dd0d06f854e76"
    retries = 0
  }
}
