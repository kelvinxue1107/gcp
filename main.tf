provider "google" {
  project = "ccs-backup-8b03e6e5"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "backup-osaka-01"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "centos-7"
    }
  }
  network_interface {
    
    network       = "${google_compute_network.vpc_network.self_link}"
    access_config { 
    }
  }
}
#define network name as backup
resource "google_compute_network" "vpc_network" {
  name                    = "backup"
  auto_create_subnetworks = "true"
}