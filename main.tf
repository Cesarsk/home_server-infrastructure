terraform {
  backend "http" {}
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

module "mysql" {
  source                     = "./modules/docker_containers/mysql"
  workspace                  = var.workspace
  mysql_prod_external_port_1 = var.mysql_prod_external_port_1
  mysql_prod_internal_port_1 = var.mysql_prod_internal_port_1
  mysql_qual_external_port_1 = var.mysql_qual_external_port_1
  mysql_qual_internal_port_1 = var.mysql_qual_internal_port_1
}

#module "portainer" {
#  source    = "./docker_containers/portainer"
#  workspace = var.workspace
#}