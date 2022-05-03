################################################################################
# DOCKER SERVER
################################################################################
resource "aws_instance"       "PACWAADT2_Docker_Host"{
  # ami                         = var.ami
  # instance_type               = var.type
  # subnet_id                   = aws_subnet.PACWAADT2_PubSN1.id
  # vpc_security_group_ids      = [aws_security_group.PACWAADT2_SG_FE.id]
  # key_name                    = "pap2key"
  # associate_public_ip_address = true

ami                         = var.doc_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
   vpc_security_group_ids      = [var.securitygroup_id]
  key_name                    = var.doc_keypair
  associate_public_ip_address = false
  user_data = <<-EOF
#!/bin/bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update -y
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
echo "license_key: eu01xx4fc443b5ef136bb617380505f93e08NRAL" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y
sudo usermod -aG docker ec2-user
sudo yum install python3 python3-pip -y
sudo alternatives --set python /usr/bin/python3
sudo pip3 install docker-py
docker run -p 8080:8080 -d --name my-app cloudhight/sample:latest
 EOF
  tags = {
     Name = var.docker_tag
   }
 }
