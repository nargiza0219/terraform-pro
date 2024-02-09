resource "aws_db_subnet_group" "example_subnet_group" {
  name       = "example-subnet-group"
  subnet_ids = [var.private_subnet, var.private_subnet2]
}


resource "aws_db_instance" "example_db_instance" {
  identifier           = "example-db-instance"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"

  username             = "admin"
  password             = "password"
  db_subnet_group_name = var.subnet_groups
  vpc_security_group_ids =  [var.security_groups]

  multi_az             = false
  skip_final_snapshot     = true
  final_snapshot_identifier = "final-snapshot-name"
}