
resource "aws_autoscaling_group" "main_asg" {
  availability_zones = ["us-east-2a"]
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2

  launch_template {
    id     = var.main_template
    version = "$Latest"
  }
}