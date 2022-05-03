output "instances_Jenkins_id" {
  value= aws_instance.PACWAADT2_Jenkins_Host.id
}

output "PACWAADT2_Jenkins_Host_Private_IP" {
  value= aws_instance.PACWAADT2_Jenkins_Host.private_ip
}
