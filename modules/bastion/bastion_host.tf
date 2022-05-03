##################################################################
#Create Bastian Host 
##################################################################
resource "aws_instance" "PACWAADT2_Bastion_Host" {
  ami                         = var.bast_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
   vpc_security_group_ids      = [var.securitygroup_id]
  key_name                    = var.bast_keypair
  associate_public_ip_address = true


  tags = {
   Name= var.bastion_tag
    }
}
