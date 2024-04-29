variable "namespace" {
  description = "The Kubernetes namespace"
  type        = string
  default     = "dev"
}

variable "postgres_storage_size" {
  description = "Storage size for PostgreSQL"
  type        = string
  default     = "5Gi"
}