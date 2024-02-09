
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "var for instance type"
  
}

variable "ami" {
  type        = string
  default     = "ami-0866a04d72a1f5479"
  description = "var for ami"
}

variable "key_name" {
  type        = string
  default     = "deployer-key"
}

variable "tags" {
  type    = map
  default = {
    Name = "my-vpc"
  }
}

# variable "availability_zone" {
#   type        = string
#   default     = "us-east-2a"
#   description = "var for availability zone"
  
# }



variable "private_subnet_id" {
  type        = string
  description = "ID of the public subnet"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "region" {
  type        = string
  default     = "us-east-2"
  description = "var for region"
}
variable "security_groups"  {
  type = list(string)
  
}

variable "key_pair" {
  type = string
  default = "deployer-key"
}

# variable "security_groups_2" {
#   type = list(string)
#   default = ["sg-0c5e8e0d5c1e3c2d1"]
  
# }
variable "user_data" {
  type = string
}