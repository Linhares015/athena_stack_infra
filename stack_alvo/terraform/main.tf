provider "google" {
  credentials = file("/home/athena-417502-0c2da699abb0.json")
  project     = "athena-417502"
  region      = "us-central1"
}

resource "google_container_cluster" "athena_cluster" {
  name     = "athena-cluster"
  location = "us-central1"

  node_pool {
    name       = "default-pool"
    node_count = 1

    node_config {
      machine_type = "e2-medium"
    }
  }
}

# Define o provedor do Helm.
provider "helm" {
  kubernetes {
    host                   = "https://${google_container_cluster.athena_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(google_container_cluster.athena_cluster.master_auth[0].cluster_ca_certificate)
  }
}

data "google_client_config" "default" {}

# Cria o namespace do ArgoCD.
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# Instalação do ArgoCD via Helm chart.
resource "helm_release" "argocd" {
  name       = "argocd"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "3.2.3"
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  # Adicione outras configurações do ArgoCD conforme necessário.
  # ...
}
