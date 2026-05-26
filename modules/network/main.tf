resource "google_compute_network" "vpc" {
  name = var.vpc_name
  auto_create_subnetworks = false 
}

resource "google_compute_subnetwork" "subnet" {
  name = var.subnet_name
  region = var.region
  network = google_compute_network.vpc.id
  ip_cidr_range = "10.10.1.0/24"
}

resource "google_compute_firewall" "allow-http" {
  name = "allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports = ["80"]
  }
    source_ranges = [ "0.0.0.0/0" ]
    target_tags = [ "web" ]
}