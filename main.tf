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
  host = var.local
}

# Start a container
resource "docker_container" "ubuntu" {
  name  = "foo"
  image = docker_image.nginx.latest
  ports {
    internal = 80
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/data-nginx-test"
    read_only = true
  }
}

# Find the latest Ubuntu precise image.
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
  keep_locally = true
}

#data "docker_registry_image" "hello-world" {
#  name = "busybox:latest"
#}

#resource "docker_image" "hello-world" {
# name = data.docker_registry_image.hello-world.name
# pull_triggers = [
#  data.docker_registry_image.hello-world.sha256_digest]
#}

#resource "docker_container" "hello-world" {
#  image    = docker_image.hello-world.latest
# name     = "busybox"
# restart  = "no"

#volumes {
#  container_path = "/myapp2151"
# replace the host_path with full path for your project directory starting from root directory /
#host_path = "/prova2151"
#  read_only = false
# }
#ports {
#  internal = var.internal_port
#  external = var.external_port
# }
# }