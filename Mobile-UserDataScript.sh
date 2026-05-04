#!/bin/bash

sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo mkdir /var/www/html/mobile
echo "<h1>This is mobile page $(hostname -f)</h1>" > /var/www/html/mobile/index.html
