metadata {
  path = "airflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:PdEP4k6GcV2CyM+cafn4F2a2ThJ2whD0kFfIGsQRhVU="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:PdEP4k6GcV2CyM+cafn4F2a2ThJ2whD0kFfIGsQRhVU="
  retries = 1
}

step "terraform-output" {
  wkdir   = "airflow"
  target  = "airflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "ba290ff3424685b862290851271d3b8a4b8c89ef9aa67397656554b3159e9e07"
  retries = 0
}

step "crds" {
  wkdir   = "airflow"
  target  = "airflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "airflow",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "airflow"
  target  = "airflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "airflow",
  ]

  sha     = "h1:BO3m2vj6XSYPLp2n51nj+7K54Rcse1fFZ+wE+2h4mKc="
  retries = 1
}
