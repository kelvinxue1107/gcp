provider "google" {
  project = "ccs-backup-8b03e6e5"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "backup-osaka-01"
  machine_type = "n1-stand-1"

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network       = "${google_compute_network.vpc_network.self_link}"
    access_config { 
    }
  }
}
resource "google_compute_network" "vpc_network" {
  name                    = "backup-network"
  auto_create_subnetworks = "true"
}