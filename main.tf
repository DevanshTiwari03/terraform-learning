module "network" {

  source = "./modules/network"

  region = var.region

  vpc_name = "ecommerce-vpc"

  subnet_name = "frontend-subnet"
}

module "compute" {
  source           = "./modules/compute"
  frontend_servers = var.frontend_servers[terraform.workspace]
  zone             = var.zone
  subnet_id        = module.network.subnet_id
}

module "loadbalancer" {

  source = "./modules/loadbalancer"

  instance_group = module.compute.instance_group
}