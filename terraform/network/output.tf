output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = [
    for subnet in aws_subnet.public :
    subnet.id
  ]
}

output "private_subnet_ids" {
  value = [
    for subnet in aws_subnet.private :
    subnet.id
  ]
}

output "private_subnet_cidrs" {
  value = [
    for subnet in aws_subnet.private :
    subnet.cidr_block
  ]
}
