# Start a container
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "db_image" {
  name = "portainer/portainer-ce:latest"
}

# create db container
resource "docker_container" "db" {
  name    = "${var.workspace}-portainer-ce"
  image   = docker_image.db_image.latest
  restart = "always"
  ports {
    internal = 8001
    external = 8001
  }
  ports {
    internal = 9001
    external = 9001
  }
}