output "public_subnet" {
  value = aws_subnet.public_subnet.id
description = "value"
}
output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
description = "value"
}
output "main_vpc" {
  value = aws_vpc.main_vpc.id
  description = "value"
}

output "private_subnet" {
  value = aws_subnet.private_subnet.id
  description = "value"
}


output "private_subnet2" {
  value = aws_subnet.private_subnet2.id
  description = "value"
}
output "subnet_groups" {
    value = aws_db_subnet_group.example_subnet_group.id
}