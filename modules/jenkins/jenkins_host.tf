
# #Creating Jenkins host
# #===================================================================
resource "aws_instance"             "PACWAADT2_Jenkins_Host" {
    ami                             = var.jen_ami
    instance_type                   = var.instance_type
    subnet_id                       = var.subnet_id
    vpc_security_group_ids          = [var.securitygroup_id]
    key_name                        = var.jen_keypair
    associate_public_ip_address     = false
  
user_data = <<-EOF
#!/bin/bash
      sudo yum update -y
      sudo yum install wget -y
      sudo yum install git -y
      sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
      sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
      sudo yum upgrade -y
      sudo yum install jenkins java-11-openjdk-devel -y --nobest
      sudo yum install epel-release java-11-openjdk-devel
      sudo systemctl daemon-reload
      sudo systemctl start jenkins
      sudo yum install -y yum-utils
      sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
      sudo yum update -y
      sudo yum install docker-ce docker-ce-cli containerd.io -y
      sudo systemctl start docker
      sudo usermod -aG docker ec2-user
      sudo usermod -aG docker jenkins
      sudo yum install maven -y
      echo "license_key: eu01xx4fc443b5ef136bb617380505f93e08NRAL" | sudo tee -a /etc/newrelic-infra.yml
      sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
      sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
      sudo yum install newrelic-infra -y
    EOF
   tags = {
        Name = var.jenkins_tag
   }
}
