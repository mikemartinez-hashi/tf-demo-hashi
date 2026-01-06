#!/bin/bash
export instance_type="${instance_type}"
export environment="${environment}"
export region="${region}"
sudo yum update -y
sudo amazon-linux-extras install -y epel
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd
sudo cat << EOF > /var/www/html/index.html
<h1>Hello! This is a sales demo from the SE Team.</h1>
<p>Instance Type: $instance_type</p>
<p>Environment: $environment</p>
<p>Region: $region</p>
EOF
