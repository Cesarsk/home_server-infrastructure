# Start a container
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

data "docker_registry_image" "mysql_registry_image" {
  name = "biarms/mysql:latest"
}

resource "docker_image" "mysql_image" {
  name         = data.docker_registry_image.mysql_registry_image.name
  keep_locally = true
}

# create db container
resource "docker_container" "mysql" {
  #  name    = "${var.workspace}-mysql-${uuid()}"
  name    = "${var.workspace}-mysql"
  image   = docker_image.mysql_image.latest
  restart = "always"
}