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

  sha     = "9e5788e6181fdd3a9c6537f50f443ee23aeea85cb552caf7430476c0f47e8cfb"
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

  sha     = "h1:HvAmvZ7Z76Gi7gvZBnwKO/jUcIRC53R+jPIBh7rrL+k="
  retries = 0
}
