variable "region" {
  type    = string
  default = "ap-northeast-1"
}

variable "site_dir" {
  type        = string
  description = "Path to the local site directory that contains index.html"
}
