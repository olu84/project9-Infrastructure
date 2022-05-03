#####################################################

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "PACWAADT2 project vpc"
}

#####################################################

variable "az_1a" {
  default     = "eu-west-1a"
  description = "availability zone for public subnet 1a"
}

variable "az_1b" {
  default     = "eu-west-1b"
  description = "availability zone for public subnet 1b"
}

#####################################################

variable "pub_subnet1" {
  default     = "10.0.1.0/24"
  description = "Public subnet 1"
}

variable "pub_subnet2" {
  default     = "10.0.2.0/24"
  description = "Public subnet 2"
}

#####################################################

variable "prv_subnet1" {
  default     = "10.0.3.0/24"
  description = "Private subnet 1"
}

variable "prv_subnet2" {
  default     = "10.0.4.0/24"
  description = "Private subnet 2"
}

variable "prv_subnet3" {
  default     = "10.0.5.0/24"
  description = "Private subnet 3"
}

variable "prv_subnet4" {
  default     = "10.0.6.0/24"
  description = "Private subnet 4"
}

#####################################################

variable "all_cidr" {
  default     = "0.0.0.0/0"
  description = "all ip addresses allowed"
}

#####################################################

variable "type" {
  default     = "t2.medium"
  description = "instance type for Docker Server"
}





#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
variable "ami" {
  default     = "ami-0ad8ecac8af5fc52b" # RedHat - euWest2 - t2.micro - free tier
  description = "ami for ec2"
}

variable "path_to_public_key" {
  default     = "~/Keypairs/pap2key.pub"
  description = "path to public key"
}

variable "port_mysql_database" {
  default = "3306"
}

variable "port_http" {
  default = "80"
}

# variable      "port_https" {
#   default     = "443"
# }

variable "port_ssh" {
  default = "22"
}

variable "port_jenkins" {
  default = "8080"
}

variable "port_docker" {
  default = "8085"
}

variable "egress" {
  default = "0"
}

########################################

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Admin123"
}

#    default     = "pap2admin"
#  }

# variable      "db_password" {
#    default     = "Admin123"
#  }


########################################

# variable      "type" {
#   default     = "A"
# }

# variable      "time_to_live" {
#   default     = "300"
# }

########################################

#variable     "zone_name" {
#  default    = "rmaleek.com"

