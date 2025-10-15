variable "project_name" {
  type        = string
  description = "Project name for tagging"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name for the static site"
}

variable "index_html_path" {
  type        = string
  description = "Local path to index.html to upload"
}

