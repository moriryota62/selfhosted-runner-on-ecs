resource "aws_autoscaling_group" "this" {
  name                 = var.base_name
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  launch_configuration = aws_launch_configuration.ecs_optimized.name
  vpc_zone_identifier  = var.private_subnet_ids

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
}