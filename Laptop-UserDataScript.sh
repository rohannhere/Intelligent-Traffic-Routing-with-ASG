#!/bin/bash

sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo mkdir /var/www/html/laptop
echo "<h1>This is laptop page $(hostname -f)</h1>" > /var/www/html/laptop/index.html
