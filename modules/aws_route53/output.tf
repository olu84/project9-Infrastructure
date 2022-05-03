output "PACWAADT2_name_servers" {
  value = aws_route53_zone.PACWAADT2_zone.name_servers
}

# output "PACWAADT2_Bastion_Host_public_IP" {
#   value= aws_instance.PACWAADT2_Bastion_Host.public_ip
# }


#  output "PACWAADT2_Bastion_Host" {
#    value = aws_instance.PACWAADT2_Bastian_Host.public_ip
#  }

#  output "PACWAADT2_Docker_Host" {
#    value = aws_instance.PACWAADT2_Docker_Host.private_ip
#  }

#  output "PACWAADT2_Ansible_Host" {
#    value = aws_instance.PACWAADT2_Ansible_Host.private_ip
#  }

#  output    "PACWAADT2_Jenkins_Host" {
#     value   = aws_instance.PACWAADT2_Jenkins_Host.private_ip
#  }

# # output    "PAP1_LB_Endpoint" {
# #   value   = aws_lb.PAP2-Docker-lb.dns_name
# # }

