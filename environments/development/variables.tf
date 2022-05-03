## Subnet related variables Starts
variable "vpc_cidr_dev" {
  default     = "10.0.0.0/16"
  description = "PACWAADT2 project vpc"
}

variable "pub_subnet1_dev" {
  default     = "10.0.1.0/24"
  description = "Public subnet 1"
}

variable "pub_subnet2_dev" {
  default     = "10.0.2.0/24"
  description = "Public subnet 2"
}

variable "prv_subnet1_dev" {
  default     = "10.0.3.0/24"
  description = "Private subnet 1"
}

variable "prv_subnet2_dev" {
  default     = "10.0.4.0/24"
  description = "Private subnet 2"
}

variable "prv_subnet3_dev" {
  default     = "10.0.5.0/24"
  description = "Private subnet 3"
}

variable "prv_subnet4_dev" {
  default     = "10.0.6.0/24"
  description = "Private subnet 4"
}
## Subnet related variables End
##======================================================
## Security Group related variables STARTS
##------------------------------------------------------
variable "sg_all_cidr_dev" {
  default     = "0.0.0.0/0"
  description = "all ip addresses allowed"
}
variable "port_ssh_dev" {
  default = "22"
}
variable "port_jenkins_dev" {
  default = "8080"
}
variable "port_mysql_dev" {
  default = "3306"
}
variable "egress_dev" {
  default = "0"
}
variable "tcp_protocol_dev" {
  default = "tcp"
}
variable "any_protocol_dev" {
  default = "-1"
}
variable "SGtag_PACWAADT2_SG_BA_dev" {
  default     = "PACWAADT2_SG_BA"
  description = "Tag Name for Bastion and Ansible Host Security Group"
}
variable "SGtag_PACWAADT2_SG_JD_dev" {
  default     = "PACWAADT2_SG_JD"
  description = "Tag Name for Jenkins and Docker Servers Security Group"
}
variable "SGtag_PACWAADT2_SG_DB_dev" {
  default     = "PACWAADT2_SG_DB"
  description = "Tag Name for Database Server Security Group"
}
## Security Group related variables ENDS
##======================================================
## Ansible Host related variables STARTS
variable "ans_ami_dev" {
  default     = "ami-0b0af3577fe5e3532" # RedHat - us-east-1 - t2.micro - free tier
  description = "AMI ID for the EC2 instance"
}
variable "instance_type_dev" {
  default     = "t2.medium"
  description = "EC2 instance type for Docker Server"
}
variable "ans_keypair_dev" {
  default = "pap2key"
}
variable "path_to_public_key_ans" {
  default     = "./pap2key.pub"
  description = "path to public key"
}
variable "ansible_tag_dev" {
  default = "PACWAADT2_Ansible_Host"
}
## Ansible Host related variables ENDS
##======================================================
## Docker Host related variables STARTS
variable "doc_ami_dev" {
  default     = "ami-0b0af3577fe5e3532" # RedHat - us-east-1 - t2.micro - free tier
  description = "AMI ID for the EC2 instance"
}
variable "doc_keypair_dev" {
  default = "pap2key"
}
variable "path_to_public_key_doc" {
  default     = "~/projects/keypairs/PACADUJ-key.pub"
  description = "path to public key"
}
variable "docker_tag_dev" {
  default = "PACWAADT2_Docker_Host"
}
## Docker Host related variables ENDS
##======================================================
## Jenkins Host related variables STARTS
variable "jen_ami_dev" {
  default     = "ami-0b0af3577fe5e3532" # RedHat - euWest2 - t2.micro - free tier
  description = "AMI ID for the EC2 instance"
}
variable "jen_keypair_dev" {
  default = "pap2key"
}
variable "path_to_public_key_jen" {
  default     = "~/projects/keypairs/PACADUJ-key.pub"
  description = "path to public key"
}
variable "jenkins_tag_dev" {
  default = "PACWAADT2_Jenkins_Host"
}
## Jenkins Host related variables ENDS
##======================================================
variable "bast_ami_dev" {
  default     = "ami-0b0af3577fe5e3532" # RedHat - euWest2 - t2.micro - free tier
  description = "AMI ID for the EC2 instance"
}
variable "bastion_tag_dev" {
  default = "PACWAADT2_Bastion_Host"
}
## Bastion Host related variables ENDS
##======================================================
variable "Domain_name_dev" {
  default = "dreamandhomes.com"
}
variable "az_A_dev" {
  default = "us-east-1a"
}
variable "az_B_dev" {
  default = "us-east-1b"
}

variable "asg_ami_dev" {
  default     = "ami-0b0af3577fe5e3532" # RedHat - us-east-1 - t2.micro - free tier
  description = "AMI ID for the EC2 instance"
}