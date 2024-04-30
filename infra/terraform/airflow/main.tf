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
          run_as_user = 0  // Usuário root, considerar mudar se possível
          run_as_group = 0 // Grupo root, considerar mudar se possível
          fs_group = 0     // fsGroup root, considerar mudar se possível
        }
        init_container {
          name            = "init-db"
          image           = "apache/airflow:latest"
          command         = ["airflow"]
          args            = ["db", "migrate"]
          volume_mount {
            mount_path   = "/opt/airflow"
            name         = "airflow-storage"
          }
          env {
            name  = "AIRFLOW__CORE__SQL_ALCHEMY_CONN"
            value = "postgresql+psycopg2://postgres:Linhares015@@${kubernetes_service.postgres.status[0].load_balancer[0].ingress[0].ip}/airflow"
          }
          security_context {
            allow_privilege_escalation = false
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
          env {
            name  = "AIRFLOW__CORE__SQL_ALCHEMY_CONN"
            value = "postgresql+psycopg2://postgres:Linhares015@@${kubernetes_service.postgres.status[0].load_balancer[0].ingress[0].ip}/airflow"
          }
          security_context {
            allow_privilege_escalation = false
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
