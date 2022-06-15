variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

variable "runner_image_repo" {
  description = "セルフホストランナーイメージのリポジトリ名"
  type        = string
}

variable "runner_image_tag" {
  description = "セルフホストランナーイメージのタグ名"
  type        = string
}

variable "github_account_token" {
  description = "GitHubアカウントのアクセストークン"
  type        = string
}

variable "target_owner" {
  description = "ターゲットリポジトリの所有者"
  type        = string
}

variable "target_repo" {
  description = "ターゲットリポジトリのリポジトリ名"
  type        = string
}
