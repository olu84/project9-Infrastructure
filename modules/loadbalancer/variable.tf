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
variable "port_web" {
  default = "80"
}
variable "port_jenkins" {
  default = "8080"
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
variable "SGtag_PACWAADT2_SG_JD" {
  default = "PACWAADT2_SG_JD"
  description = "Tag Name for Jenkins and Docker Servers Security Group"
}
variable "target_port" {
  default = "TCP:8080"
}
variable "interval" {
  default = 30
}
variable "healthy_threshold" {
  default = 2
}
variable "unhealthy_threshold" {
  default = 2
}
variable "timeout" {
  default = 3
}
variable "PACWAADT2-Docker-LB-name" {
    default = "PACWAADT2-Docker-LB"
}
# variable "tag-PACWAADT2-Docker-LB" {
#     default = "PACWAADT2Docker-LB"
# }
variable "PACWAADT2-Jenkins-LB" {
   default = "PACWAADT2-Jenkins-LB"
}
variable "connection_draining_timeout" {
  default = 400
}
variable "cross_zone_load_balancing" {
  type = bool
  default = true
}
variable "connection_draining" {
   type = bool
  default = true
}
variable "idle_timeout" {
  default = 400
}
 variable "security_groups_id" {
   type = string
   default="sg-036254702898cb50c"
 }
 variable "subnet_ids" {
  type        = string
  default     = "subnet-76a8163a,subnet-76a8163b"
  description = "Subnet ID"
}
variable "instances_Docker_id" {
  default     = "ec2-76a8163a"
  description = "instances_Docker_id"
}
variable "instances_Jenkins_id" {
  default     = "ec2-76a8163b"
  description = "instances_Jenkins_id"
}