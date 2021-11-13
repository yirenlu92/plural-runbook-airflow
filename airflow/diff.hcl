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

  sha     = "52c1df0d445d97242f3379693bd10a6815b7c601f16b4389108da20ca6dc9ad0"
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

  sha     = "h1:J7QtTRvXtatGTDKd0hMH25zmkVjUe3NZfYozjn02dX8="
  retries = 0
}
