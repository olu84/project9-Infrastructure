output "instances_Ansible_id" {
  value= aws_instance.PACWAADT2_Ansible_Host.id
}
output "PACWAADT2_Ansible_Private_IP" {
  value= aws_instance.PACWAADT2_Ansible_Host.private_ip
}
