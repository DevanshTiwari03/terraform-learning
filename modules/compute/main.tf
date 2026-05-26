resource "google_compute_instance" "frontend" {
  for_each     = var.frontend_servers
  name         = "${terraform.workspace}-${each.key}"
  machine_type = each.value
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    subnetwork = var.subnet_id
    access_config {}
  }

  metadata_startup_script = <<-EOF
#!/bin/bash

sleep 30

apt-get update -y

apt-get install -y nginx

systemctl enable nginx

systemctl start nginx

echo "<h1>${each.key}</h1>" >/var/www/html/index.html

EOF

  tags = ["web"]
}


resource "google_compute_instance_group" "frontend_group" {
  name = "frontend-group"
  zone = var.zone
  instances = [
    for vm in google_compute_instance.frontend :
    vm.self_link
  ]
}