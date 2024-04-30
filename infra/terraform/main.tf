provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

module "postgres" {
  source    = "./modules/postgres"
  namespace = var.namespace
}

module "airflow" {
  source              = "./modules/airflow"
  namespace           = var.namespace
  postgres_service_ip = module.postgres.postgres_service_ip
}
