provider "google" {
  project = "extreme-passkey-453707-n4"
  region  = "us-central1"
}

resource "google_compute_firewall" "allow_yugabytedb_ports" {
  name    = "allow-yugabytedb"
  network = "default"
  project = "extreme-passkey-453707-n4"

  allow {
    protocol = "tcp"
    ports    = ["22", "5433", "7000", "9000", "9042", "15433"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["yugabyte"]
}


resource "google_compute_instance" "yugabyte_vm" {
  count        = 3
  name         = "yugabyte-vm-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = element(["us-central1-a", "us-central1-b", "us-central1-c"], count.index)
  tags         = ["yugabyte"]

  boot_disk {
    initialize_params {
      image = "projects/extreme-passkey-453707-n4/global/images/yugabyte-db-image"
      size  = 20
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    architecture = "X86_64"
  }
}
