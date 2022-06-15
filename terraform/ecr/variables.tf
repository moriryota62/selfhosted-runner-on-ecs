# common parameter
variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

# module parameter
variable "repository_names" {
  description = "レポジトリ名のリスト"
  type        = list(string)
}

variable "keep_number" {
  description = "イメージを保持する世代数"
  type        = number
}
