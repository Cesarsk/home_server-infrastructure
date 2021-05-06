terraform {
  backend "http" {}
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

# Configure the Docker provider
provider "docker" {
  host = var.raspberry_host
}

module "mysql" {
  source                = "docker_containers/mysql"
  workspace             = var.workspace
  mysql_external_port_1 = ""
  mysql_internal_port_1 = ""
}

#module "portainer" {
#  source    = "./modules/docker_containers/portainer"
#  workspace = var.workspace
#}