# Start a container
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "db_image" {
  name         = "biarms/mysql:latest"
  keep_locally = true
}

# create db container
resource "docker_container" "db" {
  #  name    = "${var.workspace}-mysql-${uuid()}"
  name    = "${var.workspace}-mysql"
  image   = docker_image.db_image.latest
  restart = "always"
}