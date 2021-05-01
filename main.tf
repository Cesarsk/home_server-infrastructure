# TODO pull image docker automatically

terraform {
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

module "docker_containers" {
  source = "./modules/docker_containers"
}

