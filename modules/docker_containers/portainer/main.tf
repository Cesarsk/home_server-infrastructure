# Start a container
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

data "docker_registry_image" "portainer_registry_image" {
  name = "portainer/portainer-ce:latest"
}

resource "docker_image" "portainer_image" {
  name         = data.docker_registry_image.portainer_registry_image.name
  keep_locally = true
}

# create db container
resource "docker_container" "portainer_container" {
  name    = "${var.workspace}-portainer-ce"
  image   = docker_image.portainer_image.latest
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