variable "autoscaling_group_name" {
  type = string
  description = "Name of the autoscaling group"
}

variable "public_subnet" {
  type = string
  description = "ID of the public subnet"
}
variable "public_subnet2" {
  type = string
  description = "ID of the public subnet"
  
}

variable "security_groups" {
  type = string
  description = "ID of the security group"
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC"
  
}
