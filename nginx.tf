provider "google" {
  credentials = "knurons-iot-f3decdbcf4d7.json"
  project     = "knurons-iot"
  region      = "asia-south2-a"
  // zone    = "us-central1-c"
}
resource "google_compute_instance" "default" {
  name         = "nginx"
  machine_type = "e2-medium"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
    sshKeys = "knoldus:${file("test_vm.pub")}"
  }
}
resource "null_resource" "test" {
  connection {
    type        = "ssh"
    user        = "knoldus"
    private_key = file("/home/knoldus/gcp_tf/test_vm")
    host        = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
    timeout     = "120s"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo apt install nginx",
    ]
  }
}
resource "google_compute_firewall" "rules" {
  project     = "knurons-iot"
  name        = "my-firewall-rule"
  network     = "default"
  description = "Create firewall rule targeting instances"

  allow {
    protocol  = "tcp"
    ports     = ["80", "8080",]
  }
 }
output "ip" {
  value = google_compute_instance.default.network_interface.0.network_ip
}
