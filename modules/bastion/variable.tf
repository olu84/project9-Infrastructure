 variable "bast_ami" {
   type        = string
  default     = "ami-0b0af3577fe5e3532" # RedHat - us-east-1 - t2.micro - free tier
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type for Docker Server"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
 variable "securitygroup_id" {
   type = string
   default="sg-036254702898cb50c"
 }

variable "bast_keypair" {
  type        = string
  default = "pap2key"
}
variable "path_to_public_key_bast" {
  default     = "~/.ssh/id_rsa.pub"
  description = "path to public key"
}
variable "bastion_tag" {
  type        = string
  default = "PACWAADT2_Bastian_Host"
}