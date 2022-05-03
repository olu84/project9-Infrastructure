module "dev_vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = var.vpc_cidr_dev
  pub_subnet1 = var.pub_subnet1_dev
  pub_subnet2 = var.pub_subnet2_dev
  prv_subnet1 = var.prv_subnet1_dev
  prv_subnet2 = var.prv_subnet2_dev
  prv_subnet3 = var.prv_subnet3_dev
  prv_subnet4 = var.prv_subnet4_dev
  az_A        = var.az_A_dev
  az_B        = var.az_B_dev
}
module "dev_securitygroups" {
  source = "../../modules/securitygroups"
  vpc_id = module.dev_vpc.vpc_id
  depends_on = [
    module.dev_vpc
  ]
}
module "dev_ansible" {
  source           = "../../modules/ansible"
  ans_ami          = var.ans_ami_dev
  instance_type    = var.instance_type_dev
  subnet_id        = module.dev_vpc.PACWAADT2_PvtSN1_id
  ans_keypair      = var.ans_keypair_dev
  securitygroup_id = module.dev_securitygroups.PACWAADT2_SG_BA_id
  ansible_tag     = var.ansible_tag_dev
  depends_on = [
    module.dev_vpc, module.dev_securitygroups
  ]
}
module "dev_docker" {
  source           = "../../modules/dockerhost"
  doc_ami          = var.ans_ami_dev
  instance_type    = var.instance_type_dev
  subnet_id        = module.dev_vpc.PACWAADT2_PvtSN1_id
  doc_keypair      = var.doc_keypair_dev
  securitygroup_id = module.dev_securitygroups.PACWAADT2_SG_JD_id
  docker_tag     = var.docker_tag_dev
  depends_on = [
    module.dev_vpc, module.dev_securitygroups
  ]
}
module "dev_Jenkins" {
  source           = "../../modules/jenkins"
  jen_ami          = var.ans_ami_dev
  instance_type    = var.instance_type_dev
  subnet_id        = module.dev_vpc.PACWAADT2_PvtSN1_id
  jen_keypair      = var.jen_keypair_dev
  securitygroup_id = module.dev_securitygroups.PACWAADT2_SG_JD_id
  jenkins_tag     = var.jenkins_tag_dev
  depends_on = [
    module.dev_vpc, module.dev_securitygroups
  ]
}
module "dev_bastion" {
  source           = "../../modules/bastion"
  bast_ami         = var.bast_ami_dev
  instance_type    = var.instance_type_dev
  subnet_id        = module.dev_vpc.PACWAADT2_PubSN1_id
  bast_keypair     = var.jen_keypair_dev
  securitygroup_id = module.dev_securitygroups.PACWAADT2_SG_BA_id
  bastion_tag     = var.bastion_tag_dev
  depends_on = [
    module.dev_vpc, module.dev_securitygroups
  ]
}
module "dev_autoscaling" {
  source              = "../../modules/autoscaling"
  security_groups_id  = module.dev_securitygroups.PACWAADT2_SG_JD_id
  vpc_zone_identifier = module.dev_vpc.PACWAADT2_PvtSN1_id
  asg_ami             = var.asg_ami_dev
  depends_on = [
    module.dev_vpc, module.dev_securitygroups
  ]
}
module "dev_loadbalancer" {
  source               = "../../modules/loadbalancer"
  security_groups_id   = module.dev_securitygroups.PACWAADT2_SG_JD_id
  subnet_ids           = module.dev_vpc.PACWAADT2_PubSN1_id
  instances_Docker_id  = module.dev_docker.instances_Docker_id
  instances_Jenkins_id = module.dev_Jenkins.instances_Jenkins_id
  depends_on = [
    module.dev_vpc, module.dev_securitygroups, module.dev_docker, module.dev_Jenkins, module.dev_ansible, module.dev_bastion
  ]
}
module "dev_aws_route53" {
  source          = "../../modules/aws_route53"
  target_dns_name = module.dev_loadbalancer.PACWAADT2_Docker_LB
  target_zone_id  = module.dev_loadbalancer.PACWAADT2_Docker_LB_id
  Domain_name     = var.Domain_name_dev
  depends_on = [
    module.dev_vpc, module.dev_securitygroups, module.dev_docker, module.dev_Jenkins, module.dev_ansible, module.dev_bastion, module.dev_loadbalancer
  ]
}