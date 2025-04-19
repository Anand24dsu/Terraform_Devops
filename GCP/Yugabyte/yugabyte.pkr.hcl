packer {
  required_plugins {
    googlecompute = {
      version = ">= 0.0.1"
      source  = "hashicorp/googlecompute"
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
  default = "ubuntu-2404-lts"
}

variable "image_name" {
  default = "yugabyte-db-image"
}

variable "machine_type" {
  default = "n1-standard-2"
}

source "googlecompute" "yugabyte_image" {
  project_id         = var.project_id
  source_image_family = var.image_family
  machine_type       = var.machine_type
  image_name         = var.image_name
  image_family       = var.image_family
  zone               = var.zone
  ssh_username       = "packer"
}

build {
  sources = ["googlecompute.yugabyte_image"]

  provisioner "shell" {
    inline = [
      "mkdir -p /home/packer/",
      "sudo apt-get update -y && sudo apt-get install -y curl"
    ]
  }

  provisioner "file" {
    source      = "yugabyte.sh"
    destination = "/home/packer/yugabyte.sh"
  }

  provisioner "shell" {
    inline = [
      "chmod +x /home/packer/yugabyte.sh",
      "sudo /home/packer/yugabyte.sh"
    ]
  }
}
