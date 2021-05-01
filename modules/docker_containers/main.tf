# Start a container
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "db_image" {
  name = "biarms/mysql:latest"
}



# create db container
resource "docker_container" "db" {
  name  = "db_test"
  image = docker_image.db_image.latest
  restart = "always"
}