output "lb_ip" {

  value = module.loadbalancer.load_balancer_ip
}

# output "bucket_url" {
#   value = data.google_storage_bucket.shared_bucket.url
# }