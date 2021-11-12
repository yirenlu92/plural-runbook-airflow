terraform {
  backend "gcs" {
    bucket = "ren-runbook-airflow-tf-state"
    prefix = "ren-runbook-airflow/bootstrap"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.65.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.5.0"
    }
  }
}

locals {
  gcp_location  = "us-east1-b"
  gcp_location_parts = split("-", local.gcp_location)
  gcp_region         = "${local.gcp_location_parts[0]}-${local.gcp_location_parts[1]}"
}

provider "google" {
  project = "pluralsh"
  region  = local.gcp_region
}

data "google_client_config" "current" {}


provider "kubernetes" {
  host = module.gcp-bootstrap.cluster.endpoint
  cluster_ca_certificate = base64decode(module.gcp-bootstrap.cluster.ca_certificate)
  token = data.google_client_config.current.access_token
}



module "gcp-bootstrap" {
  source = "./gcp-bootstrap"

### BEGIN MANUAL SECTION <<gcp-bootstrap>>

### END MANUAL SECTION <<gcp-bootstrap>>


  gcp_project_id = "pluralsh"
  cluster_name = "ren-runbook-airflow"
  vpc_name_prefix = "ren-runbook-airflow"
  externaldns_sa_name = "ren-runbook-airflow-externaldns"
  gcp_location = "us-east1-b"

}
