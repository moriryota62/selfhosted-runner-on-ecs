resource "aws_ecs_task_definition" "this" {
  family                = var.base_name
  cpu                   = 256
  memory                = 512
  execution_role_arn    = aws_iam_role.ecs_task_execute.arn
  task_role_arn         = aws_iam_role.githubacctions_task.arn
  container_definitions = <<TASK_DEFINITION
[
  {
    "name": "github-actions-runner",
    "image": "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${var.runner_image_repo}:${var.runner_image_tag}",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "environment": [
        {
            "name": "ACCESS_TOKEN",
            "value": "${var.github_account_token}"
        },
        {
            "name": "ORGANIZATION",
            "value": "${var.target_organization}"
        },
        {
            "name": "OWNER",
            "value": "${var.target_owner}"
        },
        {
            "name": "REPO",
            "value": "${var.target_repo}"
        }
    ],
    "mountPoints": [
      {
        "readOnly": null,
        "containerPath": "/var/run/docker.sock",
        "sourceVolume": "docker"
      }
    ]
  }
]
TASK_DEFINITION

  volume {
    name      = "docker"
    host_path = "/var/run/docker.sock"
  }

}