resource "google_compute_instance" "nodejs_instance" {
  count        = 2
  name         = "nodejs-instance-${count.index}"
  machine_type = "f1-micro"

  // Create a new boot disk from an image (Lets use one created by Packer)
  boot_disk {
    initialize_params {
      image = data.google_compute_image.nodejs_image.self_link
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }

  metadata = {
    ssh-keys = "fetchsky:${file(var.public_key)}"
  }

}

data "google_compute_image" "nodejs_image" {
  family  = "golden-nodejs"
  project = var.project
}

resource "google_compute_firewall" "default" {
  name    = "tf-www-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}
