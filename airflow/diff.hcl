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

  sha     = "ba290ff3424685b862290851271d3b8a4b8c89ef9aa67397656554b3159e9e07"
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

  sha     = "h1:BO3m2vj6XSYPLp2n51nj+7K54Rcse1fFZ+wE+2h4mKc="
  retries = 0
}
