#!/bin/bash
export environment="${environment}"
export region="${region}"
export owner="${owner}"
sudo yum update -y
sudo amazon-linux-extras install -y epel
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd
echo "<html><head><title>Hello from my Terraform Demo!</title></head><body><h1>Hello from the ${owner}'s Terraform ${environment} Demo for ${region}!</h1></body></html>" | sudo tee /var/www/html/index.html > /dev/null
