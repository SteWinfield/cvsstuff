terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
    netapp-gcp = {
      source = "NetApp/netapp-gcp"
      version = "21.5.0"
    }
  }
}

provider "google" {
   # credentials = file("/home/swinfield/terraform/serviceacc.json")
    project = var.gcp_project
    region  = var.region
}

resource "google_compute_instance" "default" {
    name         = "sawadtemplate"
    machine_type = "e2-medium"
    zone         = "europe-west1-b"
    tags = ["sw-ssh", "sw-rdp", "ncv-priv-ad"]
   
  boot_disk {
      initialize_params {
          image="windows-cloud/windows-server-2019-dc-v20211012"
      }
    }
  

  network_interface {
    network = var.network
    subnetwork = "ncv-europe-west1-priv-sn"

    access_config {
      // Ephemeral public IP
    }
  }
}
