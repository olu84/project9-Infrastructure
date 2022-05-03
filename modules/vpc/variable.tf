###### VPC Modules variables
## Subnet related variables Starts
variable "vpc_cidr" {
  default   = "10.0.0.0/16"
  description = "PACWAADT2 project vpc"
}

variable "pub_subnet1" {
  default = "10.0.1.0/24"
  description = "Public subnet 1"
}

variable "pub_subnet2" {
  default = "10.0.2.0/24"
  description = "Public subnet 2"
}

variable "prv_subnet1" {
  default = "10.0.3.0/24"
    description = "Private subnet 1"
}

variable "prv_subnet2" {
  default = "10.0.4.0/24"
      description = "Private subnet 2"
}
variable "prv_subnet3" {
  default = "10.0.5.0/24"
      description = "Private subnet 2"
}
variable "prv_subnet4" {
  default = "10.0.6.0/24"
      description = "Private subnet 4"
}
## Subnet related variables End 

variable "az_A" {
  default = "us-east-1a"
  description = "availability zone for public subnet 1a"
}

variable "az_B" {
  default = "us-east-1b"
  description = "availability zone for public subnet 1b"
}

variable "pap2key" {
    default = "pap2key"
}
variable "PACWAADT2_VPC" {
    default = "PACWAADT2_VPC"
}
variable "PACWAADT2_PubSN1" {
    default = "PACWAADT2_PubSN1"
}
variable "PACWAADT2_PubSN2" {
    default = "PACWAADT2_PubSN2"
}
variable "PACWAADT2_PvtSN1" {
    default = "PACWAADT2_PvtSN1"
}
variable "PACWAADT2_PvtSN2" {
    default = "PACWAADT2_PvtSN2"
}
variable "PACWAADT2_PvtSN3" {
    default = "PACWAADT2_PvtSN3"
}
variable "PACWAADT2_PvtSN4" {
    default = "PACWAADT2_PvtSN4"
}
variable "PACWAADT2_IGW" {
    default = "PACWAADT2_IGW"
}
variable "PACWAADT2_NAT-GW" {
    default = "PACWAADT2_NAT-GW"
}
variable "PACWAADT2_EIP" {
    default = "PACWAADT2_EIP"
}
variable "PACWAADT2_RT_Pub" {
    default = "PACWAADT2_RT_Pub"
}
variable "PACWAADT2_RT_Pvt" {
    default = "PACWAADT2_RT_Pvt"
}
variable "path_to_public_key" {
  default     = "~/projects/keypairs/pap2key.pub"
  description = "path to public key"
}
variable "all_cidr" {
  default = "0.0.0.0/0"
  description = "all ip addresses allowed"
}