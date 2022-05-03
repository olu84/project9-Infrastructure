
# ingress {
#     description         = "TLS from VPC"
#     from_port           = var.port_mysql_database
#     to_port             = var.port_mysql_database
#     protocol            = "tcp"
#     cidr_blocks         = ["10.0.3.0/24", "10.0.4.0/24"]  # allow port3306 into DB servers from JAD servers
#   }


# ################################################################################
# # RDS DATABASE
# ################################################################################
# #DB Subnet
# resource "aws_db_subnet_group" "PACWAADT2_DB-SN" {
#   name       = "PACWAADT2_db-sn"
#   subnet_ids = [aws_subnet.PACWAADT2_PvtSN1.id, aws_subnet.PACWAADT2_PvtSN2.id]
#   tags = {
#     Name = "PACWAADT2_DB-SN"
#   }
# }
# #DB Instance
# resource "aws_db_instance" "PACWAADT2_DB" {
#   allocated_storage         = 20
#   engine                    = "mysql"
#   engine_version            = "8.0"
#   instance_class            = "db.t2.micro"
#   db_name                   = "PACWAADT2_DB"
#   username                  = var.db_username
#   password                  = var.db_password
#   parameter_group_name      = "default.mysql8.0"
#   skip_final_snapshot       = true
#   final_snapshot_identifier = "ignore"
#   db_subnet_group_name      = aws_db_subnet_group.PACWAADT2_DB-SN.id
#   vpc_security_group_ids    = [aws_security_group.PACWAADT2_SG_BE.id]
#   port                      = var.port_mysql_database
#   tags = {
#     Name = "PACWAADT2_DB"
#   }
# }
