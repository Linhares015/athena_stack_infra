variable "namespace" {
  description = "The Kubernetes namespace"
  type        = string
  default     = "dev"
}

variable "airflow_storage_size" {
  description = "Storage size for the Airflow volumes"
  type        = string
  default     = "5Gi"
}
