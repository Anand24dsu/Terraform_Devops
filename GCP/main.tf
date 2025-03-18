provider "google" {
  project = "extreme-passkey-453707-n4"
  region  = "us-central1"
}


# Create a Firewall Rule to Allow SSH (Port 22)
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allow SSH from anywhere (⚠️ Restrict this for security)
  target_tags   = ["ssh-access"]
}

# Create a Compute Engine Instance with SSH Key
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}  # Assigns an external IP
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/gcp_key.pub")}"
  }

  tags = ["ssh-access"]  # Ensure this matches the firewall rule
}

