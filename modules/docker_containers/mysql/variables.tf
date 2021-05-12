variable "workspace" {
  type = string
}

variable "mysql_qual_internal_port_1" {
  type      = string
  sensitive = false
}
variable "mysql_prod_internal_port_1" {
  type      = string
  sensitive = true
}

variable "mysql_qual_external_port_1" {
  type      = string
  sensitive = false
}
variable "mysql_prod_external_port_1" {
  type      = string
  sensitive = true
}