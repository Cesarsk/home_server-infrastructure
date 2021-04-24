
# TODO how to create pipeline and integrate CD / CI to this?

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  # config is in .ssh folder
  host = var.raspberry
  #host = "ssh://sha@192.168.1.6:10563"
}

data "docker_registry_image" "busybox" {
  name = "busybox:latest"
}

resource "docker_image" "busybox" {
  name          = data.docker_registry_image.busybox.name
  pull_triggers = [data.docker_registry_image.busybox.sha256_digest]
}

resource "docker_container" "busybox" {
  image   = docker_image.busybox.latest
  name    = "busybox"
  restart = "always"
  volumes {
    container_path = "/myapp"
    # replace the host_path with full path for your project directory starting from root directory /
    host_path = "/"
    read_only = false
  }
  ports {
    internal = var.internal_port
    external = var.external_port
  }
}