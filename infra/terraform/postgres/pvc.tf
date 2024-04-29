resource "kubernetes_persistent_volume_claim" "postgres_pvc" {
  metadata {
    name      = "postgres-pvc"
    namespace = var.namespace  # Usar a variável passada ao módulo para definir o namespace
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests {
        storage = var.postgres_storage_size
      }
    }
    storage_class_name = "manual" 
  }
}
