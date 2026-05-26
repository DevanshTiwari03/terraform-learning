project_id = "terraform-learning-lab-497405"

region = "us-central1"

zone = "us-central1-a"

frontend_servers = {

  default = {
    web1 = "e2-micro"
    web2 = "e2-micro"
    web3 = "e2-micro"
  }

  dev = {
    web1 = "e2-micro"
    web2 = "e2-micro"
  }

  qa = {
    web1 = "e2-small"
    web2 = "e2-small"
  }

  prod = {
    web1 = "e2-medium"
    web2 = "e2-medium"
    web3 = "e2-medium"
  }

}