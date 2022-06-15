resource "aws_ecs_service" "github-actions-runner" {
  name            = var.base_name
  cluster         = var.base_name
  task_definition = var.task_definition
  desired_count   = 1
}