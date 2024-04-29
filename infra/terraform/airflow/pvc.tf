# PVC for Airflow
resource "kubernetes_persistent_volume_claim" "airflow_pvc" {
  metadata {
    name      = "airflow-pvc"
    namespace = var.namespace 
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.airflow_storage_size
      }
    }
    storage_class_name = "manual"
  }
}

# PV for Airflow
resource "kubernetes_persistent_volume" "airflow_pv" {
  metadata {
    name = "airflow-pv"
  }

  spec {
    capacity = {
      storage = var.airflow_storage_size
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name = "manual"
    host_path {
      path = var.airflow_dag_path
    }
  }
}
