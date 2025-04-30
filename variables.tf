variable "region" {
  type        = string
  description = "AWS Region"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t3.medium"
}

variable "key_name" {
  type        = string
  description = "The name of the existing key pair for SSH access"
  default     = "linux-demo-kp"
}

variable "server" {
  #type = map(string)
  type    = string
  default = "web-server"
}

variable "demo" {
  #type = map(string)
  type    = string
  default = "tf-demo"
}
variable "environment" {
  #type = map(string)
  type        = string
  description = "Environment Type"
}

variable "owner" {
  #type = map(string)
  type    = string
  default = "SE Team"
}
