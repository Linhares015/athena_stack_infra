resource "kubernetes_deployment" "airflow" {
  metadata {
    name      = "airflow"
    namespace = kubernetes_namespace.dev.metadata[0].name
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
        container {
          image = "apache/airflow:latest"
          name  = "airflow"
          port {
            container_port = 8080
          }
          volume_mounts {
            mount_path = "/opt/airflow/dags"
            name        = "airflow-storage"
          }
        }
        volume {
          name = "airflow-storage"
          persistent_volume_claim {
            claim_name = "airflow-pvc"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "airflow" {
  metadata {
    name      = "airflow"
    namespace = kubernetes_namespace.dev.metadata[0].name
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

