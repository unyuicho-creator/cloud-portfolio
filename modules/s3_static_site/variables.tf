variable "project_name" {
  type        = string
  description = "Project name for tagging"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name for the static site"
}

variable "site_dir" {
  description = "静的サイトのビルド出力ディレクトリ（index.html を含む）"
  type        = string
}

