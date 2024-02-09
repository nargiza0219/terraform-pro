module "vpc" {
  source = "./VPC"
}

module "security_group" {
  source = "./security_groups"
  vpc_id = module.vpc.main_vpc
}
module "roles" {
  source = "./Roles"
  
}
module "ec2" {
  source           = "./EC2"
  public_subnet_id = module.vpc.public_subnet
  security_groups = [module.security_group.security_groups]
  vpc_id = module.vpc.main_vpc
  aws_iam_instance_profile = module.roles.role_profile
  user_data = filebase64("nginx.sh")
}

module "template" {
  source = "./Template"
  key_pair = module.ec2.key_pair
  private_subnet_id =  module.vpc.private_subnet # module.vpc.private_subnet
  security_groups = [module.security_group.security_groups]
  vpc_id = module.vpc.main_vpc
  user_data = filebase64("nginx.sh")
}

module "main_asg" {
  source = "./Asg"
  main_template = module.template.main_template
}

module "elb" {
  source = "./Alb"
  autoscaling_group_name = module.main_asg.main_asg
  public_subnet = module.vpc.public_subnet
  public_subnet2 = module.vpc.public_subnet2  
  security_groups = module.security_group.security_groups
  vpc_id = module.vpc.main_vpc
  
}

# module "rds" {
#   source = "./RDS"
#   subnet_groups = module.vpc.subnet_groups
#   security_groups = module.security_group.security_groups
# }
