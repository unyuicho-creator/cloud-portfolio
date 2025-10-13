variable "region" {
  type    = string
  default = "ap-northeast-1"
}
variable "project_name" {
  type    = string
  default = "cloud-portfolio"
}
variable "index_html_path" {
  type        = string
  default     = "./site/index.html"
  description = "Path to index.html to upload to S3"
}
