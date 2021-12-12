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

  sha     = "9e5788e6181fdd3a9c6537f50f443ee23aeea85cb552caf7430476c0f47e8cfb"
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

  sha     = "h1:HvAmvZ7Z76Gi7gvZBnwKO/jUcIRC53R+jPIBh7rrL+k="
  retries = 1
}
