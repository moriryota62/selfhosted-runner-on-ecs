resource "aws_ecr_repository" "this" {
  for_each = toset(var.repository_names)

  name                 = each.key
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


resource "aws_ecr_lifecycle_policy" "this" {
  for_each = toset(var.repository_names)

  repository = aws_ecr_repository.this[each.key].name

  policy = <<EOF
{
   "rules": [
       {
           "rulePriority": 1,
           "description": "Keep last ${var.keep_number} images",
           "selection": {
               "tagStatus": "any",
               "countType": "imageCountMoreThan",
               "countNumber": ${var.keep_number}
           },
           "action": {
               "type": "expire"
           }
       }
   ]
}
EOF
}