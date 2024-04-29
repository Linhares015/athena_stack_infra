variable "namespace" {
  description = "The Kubernetes namespace in which to deploy Airflow components."
  type        = string
  default     = "default"
}

variable "airflow_storage_size" {
  description = "The amount of storage to allocate for Airflow."
  type        = string
  default     = "5Gi"
}

variable "airflow_dag_path" {
  description = "Host path to sync Airflow DAGs."
  type        = string
  default     = "/mnt/data/airflow/dags"
}
