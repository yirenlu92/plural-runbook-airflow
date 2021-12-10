metadata {
  path = "airflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:PdEP4k6GcV2CyM+cafn4F2a2ThJ2whD0kFfIGsQRhVU="
  retries = 0
}

step "terraform" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airflow",
  ]

  sha     = "h1:PdEP4k6GcV2CyM+cafn4F2a2ThJ2whD0kFfIGsQRhVU="
  retries = 0
}

step "kube-init" {
  wkdir   = "airflow"
  target  = "airflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airflow",
  ]

  sha     = "bd63958e03e204ca04f520f0594249140ae4d55105ce4dbe8dbe7fb77262e644"
  retries = 0
}

step "helm" {
  wkdir   = "airflow/helm"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airflow",
  ]

  sha     = "h1:PWhNbiaxXa4W2hHWtKD1YIo6dYhcX2Fwy2094zwc00g="
  retries = 0
}
