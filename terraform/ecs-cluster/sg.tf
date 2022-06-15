resource "aws_security_group" "autoscaling" {
  name        = "${var.base_name}-autoscaling-sg"
  vpc_id      = var.vpc_id
  description = "For autoscaling"

  tags = {
    "Name" = "${var.base_name}-autoscaling-sg"
  }

  egress {
    description = "Allow any outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
