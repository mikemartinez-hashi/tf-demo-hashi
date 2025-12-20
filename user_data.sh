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
sudo cat << 'EOF' > /var/www/html/index.html
${index_html_content}
EOF
