output "gke_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "flask_service_ip" {
  value = kubernetes_service.flask_service.status[0].load_balancer[0].ingress[0].ip
}
