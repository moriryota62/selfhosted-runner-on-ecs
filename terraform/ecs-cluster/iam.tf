data "aws_iam_policy_document" "ecs_ec2" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_ec2" {
  name               = "${var.base_name}-ecs-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_ec2.json

  tags = {
    "Name" = "${var.base_name}-ecs-ec2-role"
  }
}

resource "aws_iam_role_policy_attachment" "systems_manager" {
  role       = aws_iam_role.ecs_ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ecs_ec2" {
  role       = aws_iam_role.ecs_ec2.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
