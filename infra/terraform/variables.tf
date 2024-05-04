variable "airflow_dag_path" {
  description = "Host path to sync with Airflow DAGs volume"
  default     = "/mnt/data/airflow/dags"
}

variable "namespace" {
  description = "ambiente de execução do cluster k8s"
  type    = string
  default = "dev"
}