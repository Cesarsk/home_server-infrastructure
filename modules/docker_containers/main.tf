# Start a container
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_container" "nginx" {
  name  = "nginx"
  image = docker_image.nginx.latest
  ports {
    internal = 80
  }
  volumes {
    container_path = "/usr/share/nginx/html"
    host_path = "/tmp"
    read_only = true
  }
}

# Find the latest nginx precise image.
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
  keep_locally = true
}