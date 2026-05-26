resource "google_compute_health_check" "frontend_hc" {

  name = "frontend-health"

  timeout_sec = 5

  check_interval_sec = 10

  http_health_check {

    port = 80

    request_path = "/"
  }
}

resource "google_compute_backend_service" "frontend_backend" {

  name = "frontend-backend"

  protocol = "HTTP"

  health_checks = [

    google_compute_health_check.frontend_hc.self_link
  ]

  backend {

    group = var.instance_group
  }
}

resource "google_compute_url_map" "frontend_urlmap" {

  name = "frontend-url-map"

  default_service = google_compute_backend_service.frontend_backend.self_link
}

resource "google_compute_target_http_proxy" "frontend_proxy" {

  name = "frontend-proxy"

  url_map = google_compute_url_map.frontend_urlmap.self_link
}

resource "google_compute_global_address" "lb_ip" {

  name = "frontend-lb-ip"
}

resource "google_compute_global_forwarding_rule" "frontend_rule" {

  name = "frontend-rule"

  target = google_compute_target_http_proxy.frontend_proxy.self_link

  port_range = "80"

  ip_address = google_compute_global_address.lb_ip.address
}