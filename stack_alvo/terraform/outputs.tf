output "cluster_endpoint" {
  value       = google_container_cluster.athena_cluster.endpoint
  description = "The endpoint of the Kubernetes cluster"
}

output "cluster_ca_certificate" {
  value       = google_container_cluster.athena_cluster.master_auth[0].cluster_ca_certificate
  description = "The cluster CA certificate (base64 encoded)"
}

output "gke_cluster_endpoint" {
  value = "https://${google_container_cluster.athena_cluster.endpoint}"
}
