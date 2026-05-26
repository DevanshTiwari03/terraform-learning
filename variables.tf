variable "project_id" {}

variable "region" {}

variable "zone" {}

variable "frontend_servers" {

  type = map(map(string))
}
