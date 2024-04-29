variable "namespace" {
  description = "The Kubernetes namespace in which to deploy PostgreSQL components."
  type        = string
  default     = "default"
}

variable "postgres_storage_size" {
  description = "The amount of storage to allocate for PostgreSQL."
  type        = string
  default     = "5Gi"
}

variable "postgres_data_path" {
  description = "Host path to sync PostgreSQL data."
  type        = string
  default     = "/mnt/data/postgres"
}
