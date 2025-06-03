provider "google" {
  project = "auto-project1-461104"
  region  = "asia-south1"
}

resource "google_compute_instance" "vm_instance" {
  count        = 2
  name         = "mygu-vm-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
