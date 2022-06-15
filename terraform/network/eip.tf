resource "aws_eip" "natgw" {
  count = length(var.subnet_public_cidrs)
  vpc   = true

  tags = {
    "Name" = "${var.base_name}-natgw-eip-${count.index}"
  }
}