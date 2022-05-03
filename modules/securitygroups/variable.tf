##------------------------------------------------------------
variable "sg_vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "PACWAADT2 project vpc"
}
variable "vpc_id" {
  default ="vpc-0e956f11ebd3cd342"
}
variable "tag_PACWAADT2_VPC" {
  default = "PACWAADT2_VPC"
}
variable "sg_all_cidr" {
  default     = "0.0.0.0/0"
  description = "all ip addresses allowed"
}
variable "port_ssh" {
  default = "22"
}
variable "port_jenkins" {
  default = "8080"
}
variable "port_web" {
  default = 80
}
variable "port_mysql" {
  default = "3306"
}
variable "egress" {
  default = "0"
}
variable "tcp_protocol" {
  default = "tcp"
}
variable "any_protocol" {
  default = "-1"
}
variable "SGtag_PACWAADT2_SG_BA" {
  default = "PACWAADT2_SG_BA"
   description = "Tag Name for Bastion and Ansible Host Security Group"
}
variable "SGtag_PACWAADT2_SG_JD" {
  default = "PACWAADT2_SG_JD"
  description = "Tag Name for Jenkins and Docker Servers Security Group"
}
variable "SGtag_PACWAADT2_SG_DB" {
  default = "PACWAADT2_SG_DB"
   description = "Tag Name for Database Server Security Group"
}