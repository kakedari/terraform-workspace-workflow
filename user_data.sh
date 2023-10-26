#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "ASG Demo 2.0 !!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html