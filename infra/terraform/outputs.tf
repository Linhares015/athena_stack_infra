output "postgres_service_ip" {
  value = kubernetes_service.postgres.metadata[0].name
}

output "airflow_service_ip" {
  value = kubernetes_service.airflow.metadata[0].name
}
