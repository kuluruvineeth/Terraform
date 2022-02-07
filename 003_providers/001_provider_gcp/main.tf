terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.9.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = "your credentials"
  project = "terraform-gcp-example-326401"
  region = "us-central1"
  zone = "us-central1-c"
}

data "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "ec2-micro"

  boot_disk {
      initialize_params {
          image = "debain-cloud/debian-10"
      }
  }

  network_interface {
      network = "default"
      access_config {}
  }
}