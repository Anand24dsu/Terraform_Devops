packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

variable "project_id" {
  default = "extreme-passkey-453707-n4"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "image_family" {
  default = "ubuntu"
}

variable "image_name" {
  default = "yugabyte-db-image"
}

variable "machine_type" {
  default = "n1-standard-2"
}

source "googlecompute" "yugabyte_image" {
  project_id     = var.project_id
  source_image   = "debian-cloud/debian-11" # Use full image path
  machine_type   = var.machine_type
  image_name     = var.image_name
  image_family   = var.image_family
  zone           = var.zone
  ssh_username   = "packer"
}

build {
  sources = ["source.googlecompute.yugabyte_image"]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install -y curl wget tar",
      "curl -s https://download.yugabyte.com/get_latest_version | bash",
      "sudo mv yugabyte-* /opt/yugabyte",
      "echo 'export PATH=/opt/yugabyte/bin:$PATH' >> ~/.bashrc"
    ]
  }

  provisioner "shell" {
    inline = [
      "sudo useradd -m yugabyte",
      "sudo mkdir -p /var/lib/yugabyte",
      "sudo chown yugabyte:yugabyte /var/lib/yugabyte",
      "echo 'export YB_HOME=/opt/yugabyte' >> /home/yugabyte/.bashrc",
      "echo 'export PATH=$YB_HOME/bin:$PATH' >> /home/yugabyte/.bashrc"
    ]
  }
}