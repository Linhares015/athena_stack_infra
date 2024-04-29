output "postgres_service_ip" {
  value = module.postgres.postgres_service_ip
}

output "airflow_service_ip" {
  value = module.airflow.airflow_service_ip
}
