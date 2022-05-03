output "instances_Docker_id" {
  value= aws_instance.PACWAADT2_Docker_Host.id
}
output "PACWAADT2_Docker_Host_Private_IP" {
  value= aws_instance.PACWAADT2_Docker_Host.private_ip
}
