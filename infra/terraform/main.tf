provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

module "postgres" {
  source = "./postgres"  # O caminho deve apontar para a pasta do módulo
  # Passe aqui quaisquer variáveis necessárias para o módulo
}

module "airflow" {
  source = "./airflow"  # O caminho deve apontar para a pasta do módulo
  # Passe aqui quaisquer variáveis necessárias para o módulo
}
