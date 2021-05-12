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
  name          = data.docker_registry_image.mysql_registry_image.name
  keep_locally  = true
  pull_triggers = [data.docker_registry_image.mysql_registry_image.sha256_digest]
  force_remove  = true
}

# create db container

resource "docker_container" "mysql" {
  #  name    = "${var.workspace}-mysql-${uuid()}"
  name    = "${var.workspace}-mysql"
  image   = docker_image.mysql_image.latest
  restart = "always"
  ports {
    internal = var.workspace == "qual" ? var.mysql_qual_internal_port_1 : var.mysql_prod_internal_port_1
    external = var.workspace == "qual" ? var.mysql_qual_external_port_1 : var.mysql_prod_external_port_1
  }
}