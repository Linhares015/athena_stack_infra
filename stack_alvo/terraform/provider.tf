provider "kubernetes" {
  host                   = "https://34.69.182.1"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.athena_cluster.master_auth[0].cluster_ca_certificate)
}
