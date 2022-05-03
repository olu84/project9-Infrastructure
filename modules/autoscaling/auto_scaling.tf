# ###############################################################################
# ###########       AUTO SCALING        #########################################
# ###############################################################################

# Launch configuration for ASG to spin up ec2 instances in ASG for Docker Servers/Hosts
resource "aws_launch_configuration" "PACWAADT2_AWS_LC" {
  name_prefix                 = var.PACWAADT2_AWS_LC
  image_id                    = var.asg_ami # Depends on image of Docker Host
  instance_type               = var.instance_type
  security_groups             = [var.security_groups_id]
  associate_public_ip_address = false
  key_name                    = var.asg_pap2key
  user_data              = <<-EOF
#!/bin/bash
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
  
  lifecycle {
    create_before_destroy = false
  }
}

#Creating Autoscaling Group 
resource "aws_autoscaling_group" "PACWAADT2_AWS_ASG" {
  name                      = var.PACWAADT2_AWS_ASG
  desired_capacity          = var.desired_capacity 
  max_size                  = var.max_size 
  min_size                  = var.min_size 
  health_check_grace_period = var.health_check_grace_period 
  default_cooldown          = var.default_cooldown 
  health_check_type         = var.ELB
  force_delete              = true
  launch_configuration      = aws_launch_configuration.PACWAADT2_AWS_LC.name
  vpc_zone_identifier       = [var.vpc_zone_identifier]
  #availability_zones = [var.availability_zones]
  tag {
    key                 = var.tag_name
    value               = var.PACWAADT2_Docker_ASG
    propagate_at_launch = true
  }
}
# #Creating Autoscaling Policy   
resource "aws_autoscaling_policy" "PACWAADT2-ASG-Pol" {
  name                   = var.PACWAADT2-ASG-Pol
  policy_type            = var.policy_type
  adjustment_type        = var.adjustment_type
  autoscaling_group_name = aws_autoscaling_group.PACWAADT2_AWS_ASG.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }
    target_value = var. target_value 
  }
}
