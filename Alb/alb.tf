resource "aws_lb_target_group" "tf-target" {
    vpc_id = var.vpc_id
    name     = "tf-target"
    port     = 80
    protocol = "HTTP"
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = var.autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.tf-target.arn
}

# data "aws_subnet" "subnet-pub" {
#   id = var.public_subnet
# }


resource "aws_lb" "class" {
  name               = "test-elb"
  subnets            = [var.public_subnet, var.public_subnet2]
  security_groups     = [var.security_groups]
}


resource "aws_lb_listener" "class" {
  load_balancer_arn = aws_lb.class.arn
  port              = 80
  protocol          = "HTTP"
 
  default_action {
    target_group_arn = aws_lb_target_group.tf-target.arn
    type             = "forward"
  }
}
