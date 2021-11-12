locals {
  gcp_location_parts = split("-", var.gcp_location)
  gcp_region         = "${local.gcp_location_parts[0]}-${local.gcp_location_parts[1]}"
}

resource "kubernetes_namespace" "airflow" {
  metadata {
    name = var.namespace

    labels = {
      "app.kubernetes.io/managed-by" = "plural"
    }
  }
}

resource "kubernetes_service_account" "airflow" {
  metadata {
    name      = "airflow"
    namespace = var.namespace
    annotations = {
      "iam.gke.io/gcp-service-account" = module.airflow-workload-identity.gcp_service_account_email
    }
  }

  depends_on = [
    kubernetes_namespace.airflow
  ]
}

resource "google_storage_bucket" "airflow_bucket" {
  name = var.airflow_bucket
  project = var.project_id
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "airflow" {
  bucket = google_storage_bucket.airflow_bucket.name
  role = "roles/storage.admin"
  member = "serviceAccount:${module.airflow-workload-identity.gcp_service_account_email}"

  depends_on = [
    google_storage_bucket.airflow_bucket,
  ]
}

module "airflow-workload-identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name       = "${var.cluster_name}-airflow"
  namespace  = var.namespace
  project_id = var.project_id
  use_existing_k8s_sa = true
  annotate_k8s_sa = false
  k8s_sa_name = "airflow"
  roles = []
}