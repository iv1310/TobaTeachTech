provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "asia-southeast2-a"
}

resource "google_compute_instance" "instances" {
  name         = "instances-tf"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = 30
      type  = "pd-ssd"
    }
  }

  tags = ["http-server", "https-server"]

  scheduling {
    automatic_restart = false
    preemptible = true
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
