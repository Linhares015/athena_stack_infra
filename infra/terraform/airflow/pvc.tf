resource "kubernetes_persistent_volume_claim" "airflow_pvc" {
  metadata {
    name      = "airflow-pvc"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests {
        storage = var.airflow_storage_size
      }
    }
    storage_class_name = "manual"
    volume_name        = "airflow-pv"
  }
}

resource "kubernetes_persistent_volume" "airflow_pv" {
  metadata {
    name      = "airflow-pv"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    capacity {
      storage = var.airflow_storage_size
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    host_path {
      path = var.airflow_dag_path
    }
  }
}
