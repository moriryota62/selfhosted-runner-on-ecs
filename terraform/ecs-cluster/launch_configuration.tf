data "aws_ssm_parameter" "ecs_optimized_ami_image_id" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

resource "aws_iam_instance_profile" "ecs_ec2" {
  name = "es2_container_service"
  role = aws_iam_role.ecs_ec2.name
}

resource "aws_launch_configuration" "ecs_optimized" {
  name                 = "${var.base_name}-ecs_optimized"
  image_id             = data.aws_ssm_parameter.ecs_optimized_ami_image_id.value
  instance_type        = var.instance_type
  security_groups      = [aws_security_group.autoscaling.id]
  iam_instance_profile = aws_iam_instance_profile.ecs_ec2.name

  user_data = <<EOF
#!/bin/bash
echo ECS_CLUSTER=${var.base_name} >> /etc/ecs/ecs.config;
EOF

}
