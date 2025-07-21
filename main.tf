# GKE Cluster
resource "google_container_cluster" "primary" {
  name     = "flask-gke-cluster"
  location = "us-central1-b"

  initial_node_count = 1

  node_config {
    machine_type = "n1-standard-1"
    disk_type    = "pd-standard"
    disk_size_gb = 100
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Get credentials for Kubernetes provider
data "google_client_config" "default" {}

# Kubernetes Deployment for Flask App
resource "kubernetes_deployment" "flask_deployment" {
  metadata {
    name = "flask-deployment"
    labels = {
      app = "flask-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "flask-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask-app"
        }
      }

      spec {
        container {
          name  = "flask-container"
          image = "gcr.io/flask-gke-2025/flask-app:latest"  # Replace with your image name
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

# Kubernetes Service
resource "kubernetes_service" "flask_service" {
  metadata {
    name = "flask-service"
  }

  spec {
    selector = {
      app = "flask-app"
    }

    port {
      port        = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
}
