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

  sha     = "52c1df0d445d97242f3379693bd10a6815b7c601f16b4389108da20ca6dc9ad0"
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

  sha     = "h1:J7QtTRvXtatGTDKd0hMH25zmkVjUe3NZfYozjn02dX8="
  retries = 1
}
