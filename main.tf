
provider "google" {
  project = "auto-project1-461104"
  region  = "asia-south1"
}
variable "vm_names" {
  type    = list(string)
  default = ["my-vm201", "my-vm202"]
}

resource "google_compute_instance" "vm_instance" {
  for_each    = toset(var.vm_names)
  name        = each.value
  machine_type = "e2-medium"
  zone        = "asia-south1-a"

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
