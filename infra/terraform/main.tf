provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  # determine boot disk
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }
  # network interface
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    sshKeys = "sofinan:${file("/home/sofinan/.ssh/id_rsa.pub")}"
  }
  tags = ["reddit-app"]

  connection {
    type        = "ssh"
    user        = "sofinan"
    agent       = false
    private_key = "${file("/home/sofinan/appuser")}"
    host        = "${google_compute_instance.app.network_interface.0.access_config.0.nat_ip}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
