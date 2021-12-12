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

  sha     = "h1:NJVOG4/+r5dv7cqQ0vNx8ONrLGaCsL0I0cMnW1Z2pdA="
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

  sha     = "h1:NJVOG4/+r5dv7cqQ0vNx8ONrLGaCsL0I0cMnW1Z2pdA="
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

  sha     = "h1:NJVOG4/+r5dv7cqQ0vNx8ONrLGaCsL0I0cMnW1Z2pdA="
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

  sha     = "4aff5678cf6237c66f3d4dc5ead5e13f5cb8051d88df2483a328e36ce998e595"
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

  sha     = "h1:cUwuppnnKsKqFlLXurR1Jrn7Kug+T3CMLf9vRyDVadM="
  retries = 1
}
