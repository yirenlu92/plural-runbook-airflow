metadata {
  path = "airflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airflow/terraform"
  target  = "airflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:NJVOG4/+r5dv7cqQ0vNx8ONrLGaCsL0I0cMnW1Z2pdA="
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
    "airflow",
  ]

  sha     = "4aff5678cf6237c66f3d4dc5ead5e13f5cb8051d88df2483a328e36ce998e595"
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

  sha     = "h1:cUwuppnnKsKqFlLXurR1Jrn7Kug+T3CMLf9vRyDVadM="
  retries = 0
}
