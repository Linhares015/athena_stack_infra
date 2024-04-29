variable "airflow_dag_path" {
  description = "Host path to sync with Airflow DAGs volume"
  default     = "/mnt/data/airflow/dags"
}

variable "namespace" {
  default = "dev"
  type    = string
  default = "dev"
}