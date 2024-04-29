variable "postgres_storage_size" {
  description = "Storage size for PostgreSQL"
  default     = "5Gi"
}

variable "airflow_storage_size" {
  description = "Storage size for Airflow"
  default     = "5Gi"
}

variable "airflow_dag_path" {
  description = "Host path to sync with Airflow DAGs volume"
  default     = "/mnt/data/airflow/dags"
}

variable "namespace" {
  default = "dev"
}