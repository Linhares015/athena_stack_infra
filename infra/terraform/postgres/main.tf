resource "kubernetes_config_map" "db_setup" {
  metadata {
    name      = "db-setup-script"
    namespace = var.namespace
  }

  data = {
    "setup.sql" = <<-EOF
      CREATE SCHEMA IF NOT EXISTS airflow;
      CREATE SCHEMA IF NOT EXISTS dw; -- Data Warehouse schema
      -- Outros comandos SQL se necessário
    EOF
  }
}

resource "kubernetes_deployment" "postgres" {
  metadata {
    name      = "postgres"
    namespace = var.namespace
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }
      spec {
        init_container {
          name  = "init-db"
          image = "postgres:latest"
          command = ["sh", "-c", "until pg_isready -h localhost -p 5432; do echo waiting for database; sleep 2; done; psql -U postgres -d postgres -a -f /setup-scripts/setup.sql"]
          env {
            name  = "PGPASSWORD"
            value = "Linhares015@@"
          }
          volume_mounts {
            mount_path = "/setup-scripts"
            name       = "setup-script"
          }
        }
        container {
          image = "postgres:latest"
          name  = "postgres"
          env {
            name  = "POSTGRES_PASSWORD"
            value = "Linhares015@@" 
          }
          port {
            container_port = 5432
          }
          volume_mount {
            mount_path = "/var/lib/postgresql/data"
            name       = "postgres-storage"
          }
        }
        volume {
          name = "postgres-storage"
          persistent_volume_claim {
            claim_name = "postgres-pvc"
          }
        }
        volume {
          name = "setup-script"
          config_map {
            name = kubernetes_config_map.db_setup.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  metadata {
    name      = "postgres"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "postgres"
    }
    port {
      port        = 5432
      target_port = 5432
    }
    type = "LoadBalancer"
  }
}

output "postgres_service_ip" {
  value = kubernetes_service.postgres.status[0].load_balancer[0].ingress[0].ip
}
