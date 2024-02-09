resource "aws_vpc" "main_vpc" {

    cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "public_subnet"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "public_subnet"
  }
}



resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "private subnet"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "private subnet"
  }
}



resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Main Internet Gateway"
  }
}


resource "aws_route_table" "rt-public_subnet" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "route table for my project vpc"
  }
}
resource "aws_route_table_association" "first-association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt-public_subnet.id
}
resource "aws_eip" "elastic-ip" {}


resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id    = "${aws_subnet.public_subnet.id}"

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main_igw]
}
resource "aws_route_table" "rt-private_subnet" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "route table for my private subnet"
  }
}
resource "aws_route_table_association" "third-association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.rt-private_subnet.id
}

# resource "aws_db_subnet_group" "example_subnet_group" {
#   name       = "example-subnet-group"
#   subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.private_subnet.id]
# }
resource "aws_db_subnet_group" "example_subnet_group" {
  name       = "example-subnet-group"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public_subnet2.id]
}