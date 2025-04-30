output "public_ip" {
  value = aws_instance.web_server.public_ip
}

output "public_dns" {
  value = aws_instance.web_server.public_dns
}

output "instance_id" {
  value = aws_instance.web_server.id
}

output "security_group_id" {
  value = aws_security_group.allow_ssh_and_http.id
}
