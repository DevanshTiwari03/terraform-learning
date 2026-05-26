terraform {
  backend "gcs" {
    bucket = "terraform-learning-state-497405"
    prefix = "ecommerce-project"
  }
}