provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

module "postgres" {
  source    = "./postgres"
  namespace = var.namespace
}

module "airflow" {
  source    = "./airflow"
  namespace = var.namespace
}
