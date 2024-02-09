resource "aws_launch_template" "main_template" {
 
  description    = "Example Launch Template"
  image_id = var.ami   
  instance_type = var.instance_type
  key_name = var.key_pair

  

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    subnet_id      = var.private_subnet_id
    security_groups    = var.security_groups
  }
   

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ExampleInstance"
    }
  }
 user_data = var.user_data
}