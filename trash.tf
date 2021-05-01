data "docker_registry_image" "db_registry" {
  name = "mongo-express:latest"
}
//resource "docker_container" "host1" {
//  image = docker_image.ubuntu.latest
//  name = "ubuntu-container-1"
//  attach = false
//  must_run = true
//  # publish_all_ports = true
//  # Exited (0) means program successfully completed. With docker you need to execute some long running commands
//  # to ensure it doesn't finish immediately.
//  # Best way to test some changes with docker, is waiting for nothing. Try this:
//  command = [
//    "tail", "-f", "/dev/null"
//  ]
//#  command = ["sleep", "2"]
//}
//
//data "docker_registry_image" "ubuntu" {
//  name = "ubuntu:18.04"
//}
//
//resource "docker_image" "ubuntu" {
//  name = data.docker_registry_image.ubuntu.name
//  # TODO what does it do?
//  pull_triggers = [data.docker_registry_image.ubuntu.sha256_digest]
//}
//
//resource "docker_volume" "portainer_data" {
//  name = "portainer_data"
//}
//resource "docker_container" "portainer-container" {
//  image = "portainer/portainer-ce"
//  name = "portainer-container"
//  restart = "always"
//  volumes {
//    container_path = "/var/run/docker.sock"
//    host_path = "/var/run/docker.sock"
//    read_only = false
//  }
//  mounts {
//    target = "/portainer_data"
//    source = docker_volume.portainer_data.name
//    type = "volume"
//    read_only = false
//  }
//  ports {
//    internal = 8000
//    external = 8000
//  }
//  ports {
//    internal = 9000
//    external = 9000
//  }
//}