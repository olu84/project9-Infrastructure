#####################################################
variable "instance_type" {
  default     = "t2.medium"
  description = "instance type for Docker Server"
}
variable "asg_pap2key" {
  default = "pap2key"
}
variable "path_to_public_key_asg" {
  default     = "~/projects/keypairs/PACADUJ-key.pub"
  description = "path to public key"
}
variable "asg_ami" {
  #default     = "ami-0f6942040fa816ed6" # RedHat - euWest2 - t2.micro - free tier
  default     = "ami-0b0af3577fe5e3532" # RedHat - us-east-1 - t2.micro - free tier
  description = "ami for ec2"
}
variable "vpc_zone_identifier" {
  type        = string
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
 variable "security_groups_id" {
   type = string
   default="sg-036254702898cb50c"
 }

variable "PACWAADT2_AWS_LC" {
  default = "PACWAADT2_AWS_LC"
}

variable "PACWAADT2_AWS_ASG" {
  default = "PACWAADT2_AWS_ASG"
}
variable "desired_capacity" {
  default = "2"
}
variable "max_size" {
  default = "4"
}
variable "min_size" {
  default = "2"
}
variable "health_check_grace_period" {
  default = "300"
}
variable "default_cooldown" {
  default = "60"
}
variable "ELB" {
  default = "ELB"
}
variable "tag_name" {
  default = "Name"
}
variable "PACWAADT2_Docker_ASG" {
  default = "PACWAADT2_Docker_ASG"
}

variable "PACWAADT2-ASG-Pol" {
  default = "PACWAADT2-ASG-Pol"
}
variable "policy_type" {
  default = "TargetTrackingScaling"
}
variable "adjustment_type" {
  default = "ChangeInCapacity"
}
variable "predefined_metric_type" {
  default = "ASGAverageCPUUtilization"
}
variable "target_value" {
  default = "60.0"
}