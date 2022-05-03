output "lb_dns_name_Docker" {
  value = module.dev_loadbalancer.PACWAADT2_Docker_LB
}

output "lb_dns_name_Jenkins" {
  value = module.dev_loadbalancer.PACWAADT2_Jenkins_LB
}

output "Bastion_Host_public_ip" {
  value = module.dev_bastion.PACWAADT2_Bastion_Host_public_IP
}
output "Jenkins_private_ip" {
  value = module.dev_Jenkins.PACWAADT2_Jenkins_Host_Private_IP
}
output "Docker_private_ip" {
  value = module.dev_docker.PACWAADT2_Docker_Host_Private_IP
}
output "Ansible_private_ip" {
  value = module.dev_ansible.PACWAADT2_Ansible_Private_IP
}

output "name_servers" {
  value = module.dev_aws_route53.PACWAADT2_name_servers
}
