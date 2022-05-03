##################################################################
#Create Ansible Host 
##################################################################
resource "aws_instance" "PACWAADT2_Ansible_Host" {
  ami                         = var.ans_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
   vpc_security_group_ids      = [var.securitygroup_id]
  key_name                    = var.ans_keypair
  associate_public_ip_address = false
  user_data                   = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install python3 python3-pip -y
sudo alternatives --set python /usr/bin/python3
sudo pip3 install docker-py
sudo yum install ansible -y
sudo yum install -y yum-utils -y
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo systemctl start docker
cd /etc/ansible
sudo yum install unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
./aws/install -i /usr/local/aws-cli -b /usr/local/bin
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
sudo ln -svf /usr/local/bin/aws /usr/bin/aws
sudo yum install vim -y
sudo chown -R ec2-user:ec2-user /etc/ansible && chmod +x /etc/ansible
sudo touch MyPlaybook.yaml
echo "license_key: eu01xx4fc443b5ef136bb617380505f93e08NRAL" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y
EOF

  tags = {
   Name= var.ansible_tag
    }
}
