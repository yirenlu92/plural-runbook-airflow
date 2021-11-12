terraform {
  backend "gcs" {
    bucket = "ren-runbook-airflow-tf-state"
    prefix = "ren-runbook-airflow/ingress-nginx"
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


data "google_container_cluster" "cluster" {
  name = "ren-runbook-airflow"
  location = local.gcp_region
}

provider "kubernetes" {
  host = data.google_container_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
  token = data.google_client_config.current.access_token
}



module "gcp" {
  source = "./gcp"

### BEGIN MANUAL SECTION <<gcp>>

### END MANUAL SECTION <<gcp>>


  namespace = "ingress-nginx"
  

}
