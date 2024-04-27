provider "google" {
  project = "athena-421420"
  region  = "us-east1"
}

resource "google_compute_instance" "default" {
  name         = "instancia-f1-micro"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // A configuração de IP externo é opcional.
    }
  }
}

resource "google_monitoring_notification_channel" "email" {
  type = "email"
  labels = {
    email_address = "seu-email@example.com"
  }
  user_labels = {
    label = "value"
  }
}

resource "google_monitoring_alert_policy" "high_cost_alert" {
  display_name = "High Cost Alert"

  conditions {
    display_name = "Cost above 50 BRL"

    condition_threshold {
      filter     = "metric.type=\"billing.googleapis.com/charges\" resource.type=\"project\""
      duration   = "86400s"
      comparison = "COMPARISON_GREATER_THAN"
      threshold_value = 50
      aggregations {
        alignment_period   = "86400s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.id]

  combiner = "OR"
  enabled = true
}
