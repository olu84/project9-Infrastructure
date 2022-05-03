resource "aws_security_group" "PACWAADT2_SG_BA" {
  name        = "PACWAADT2_SG_BA"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = var.port_ssh
    to_port     = var.port_ssh
    protocol    = var.tcp_protocol
    cidr_blocks = [var.sg_all_cidr]
  }

  egress {
    from_port   = var.egress
    to_port     = var.egress
    protocol    = var.any_protocol
    cidr_blocks = [var.sg_all_cidr]
  }

  tags = {
    Name = var.SGtag_PACWAADT2_SG_BA
  }
}

##################################################################
# SECURITY GROUP ( Jenkins and Docker hosts)         2
##################################################################
resource "aws_security_group" "PACWAADT2_SG_JD" {
  name                  = "PACWAADT2_SG_JD"
  description           = "Allow TLS inbound traffic"
  vpc_id                = var.vpc_id

  ingress {
    description         = "SSH"
    from_port           = var.port_ssh
    to_port             = var.port_ssh
    protocol            = var.tcp_protocol
    cidr_blocks         = [var.sg_vpc_cidr]  # allow port22 into JAD servers from bastion
  }

  ingress {
    description         = "PROXY"
    from_port           = var.port_jenkins
    to_port             = var.port_jenkins
    protocol            = var.tcp_protocol
    cidr_blocks         = [var.sg_all_cidr]  
  }
  ingress {
    description         = "HTTP"
    from_port           = var.port_web
    to_port             = var.port_web
    protocol            = var.tcp_protocol
    cidr_blocks         = [var.sg_all_cidr]  
  }


  egress {
    from_port           = var.egress
    to_port             = var.egress
    protocol            = var.any_protocol
    cidr_blocks         = [var.sg_all_cidr]
  }

  tags = {
    Name                = var.SGtag_PACWAADT2_SG_JD
  }
  }
##################################################################
# SECURITY GROUP (Database)                   3
##################################################################
resource "aws_security_group" "PACWAADT2_SG_DB" {
  name                  = "PACWAADT2_SG_DB"
  description           = "Allow TLS inbound traffic"
  vpc_id                = var.vpc_id

  ingress {
    description         = "TLS from VPC"
    from_port           = var.port_ssh
    to_port             = var.port_ssh
    protocol            = var.tcp_protocol
    cidr_blocks         = [var.sg_vpc_cidr]  # allow port22 into JAD servers from bastion
  }
  ingress {
    description         = "TLS from VPC"
    from_port           = var.port_mysql
    to_port             = var.port_mysql
    protocol            = var.tcp_protocol
    cidr_blocks         = [var.sg_vpc_cidr]   
  }
  egress {
    from_port           = var.egress
    to_port             = var.egress
    protocol            = var.any_protocol
    cidr_blocks         = [var.sg_all_cidr]
  }
  tags = {
    Name                = var.SGtag_PACWAADT2_SG_DB
  }
  }
