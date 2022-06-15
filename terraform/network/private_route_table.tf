resource "aws_route_table" "private" {
  count = length(var.subnet_private_cidrs)

  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "${var.base_name}-private-route-table-${count.index}"
  }
}

resource "aws_route" "private" {
  count = length(var.subnet_public_cidrs)

  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw[count.index].id
}

resource "aws_route_table_association" "private" {
  count = length(var.subnet_private_cidrs)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
