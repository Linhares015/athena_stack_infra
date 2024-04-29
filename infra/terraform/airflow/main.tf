resource "kubernetes_deployment" "airflow" {
  metadata {
    name      = "airflow"
    namespace = var.namespace 
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "airflow"
      }
    }
    template {
      metadata {
        labels = {
          app = "airflow"
        }
      }
      spec {
        init_container {
          name            = "init-db"
          image           = "apache/airflow:latest"
          command         = ["airflow"]
          args            = ["db", "init"]
          volume_mount {
            mount_path   = "/opt/airflow"
            name         = "airflow-storage"
          }
        }
        container {
          image           = "apache/airflow:latest"
          name            = "airflow"
          command         = ["airflow"]
          args            = ["webserver"]
          port {
            container_port = 8080
          }
          volume_mount {
            mount_path     = "/opt/airflow/dags"
            name           = "airflow-storage"
          }
        }
        volume {
          name            = "airflow-storage"
          persistent_volume_claim {
            claim_name    = "airflow-pvc"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "airflow" {
  metadata {
    name      = "airflow"
    namespace = var.namespace 
  }

  spec {
    selector = {
      app = "airflow"
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}

output "airflow_service_ip" {
  value = kubernetes_service.airflow.status[0].load_balancer[0].ingress[0].ip
}
