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
  source    = "./modules/docker_containers/mysql"
  workspace = var.workspace
}

module "portainer" {
  source    = "./modules/docker_containers/portainer"
  workspace = var.workspace
}