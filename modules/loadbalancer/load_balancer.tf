# ###############################################################################
# ###########  LOAD BALANCER ####################################################
# ###############################################################################
#
# Add an Elastic Load Balancer for Docker
# =======================================
resource "aws_elb" "PACWAADT2_Docker_LB" {
  name               = var.PACWAADT2-Docker-LB-name
  subnets = [var.subnet_ids]
security_groups = [var.security_groups_id]
  listener {
    instance_port     = var.port_jenkins
    instance_protocol = var.tcp_protocol
    lb_port           = var.port_web
    lb_protocol       = var.tcp_protocol
  }
  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    target              = var.target_port
    interval            = var.interval
  }
  instances                   = [var.instances_Docker_id]
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  tags = {
    Name = var.PACWAADT2-Docker-LB-name
  }
}
# Add an Elastic Load Balancer - explicitly for Jenkins Sever
# ============================================================
resource "aws_elb" "PACWAADT2_Jenkins_LB" {
  name               = var.PACWAADT2-Jenkins-LB
  subnets = [var.subnet_ids]
security_groups = [var.security_groups_id]
  listener {
    instance_port     = var.port_jenkins
    instance_protocol = var.tcp_protocol
    lb_port           = var.port_web
    lb_protocol       = var.tcp_protocol
  }
  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    target              = var.target_port
    interval            = var.interval
  }
  instances                   = [var.instances_Jenkins_id]
  cross_zone_load_balancing   = var.connection_draining
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout
  tags = {
    Name = var.PACWAADT2-Jenkins-LB
  }
}