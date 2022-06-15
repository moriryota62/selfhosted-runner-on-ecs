# common parameter
variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

# module parameter
variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "private_subnet_ids" {
  description = "プライベートサブネットのID"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2のインスタンスタイプ"
  type        = string
}

variable "max_size" {
  description = "最大数"
  type        = number
}

variable "min_size" {
  description = "最小数"
  type        = number
}

variable "desired_capacity" {
  description = "希望数"
  type        = number
}