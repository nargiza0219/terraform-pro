
variable "instance_type" {
  type        = string
  default     = "t2.micro"
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

variable "public_subnet_id" {
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

variable "aws_iam_instance_profile" {
  type = string
} 
variable "user_data" {
  type = string
}



