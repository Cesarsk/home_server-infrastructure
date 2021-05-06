variable "workspace" {
  type = string
}

variable "mysql_internal_port_1" {
  type      = string
  sensitive = true
}
variable "mysql_external_port_1" {
  type      = string
  sensitive = true
}