# GCP Provider for Terraform
provider "google" {
  credentials = file("C:/Users/1/flask-gke-project/flask-gke-2025-6fe6d524ba1f.json")
  project     = "flask-gke-2025"
  region      = "us-central1"
  zone        = "us-central1-b"
}

# Kubernetes Provider - will configure automatically from GKE
provider "kubernetes" {
  host = "https://${google_container_cluster.primary.endpoint}"
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}
