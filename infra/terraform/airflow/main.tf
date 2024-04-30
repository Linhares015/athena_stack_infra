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
        security_context {
          run_as_user = 0
          run_as_group = 0
          fs_group = 0
        }
        init_container {
          name            = "init-db"
          image           = "apache/airflow:latest"
          command         = ["airflow"]
          args            = ["db", "init"]
          volume_mount {
            mount_path   = "/opt/airflow"
            name         = "airflow-storage"
          }
          security_context {
            allowPrivilegeEscalation = false
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
          security_context {
            allowPrivilegeEscalation = false
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
