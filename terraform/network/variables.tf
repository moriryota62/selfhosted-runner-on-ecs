# common parameter
variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

# module parameter
variable "vpc_cidr" {
  description = "VPCのネットワークアドレス帯"
  type        = string
}

variable "subnet_public_cidrs" {
  description = "パブリックサブネットのアドレス帯"
  type        = list(string)
}

variable "subnet_private_cidrs" {
  description = "プライベートサブネットのアドレス帯"
  type        = list(string)
}
