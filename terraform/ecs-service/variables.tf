# common parameter
variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

variable "task_definition" {
  description = "実行するタスク定義"
  type        = string
}
