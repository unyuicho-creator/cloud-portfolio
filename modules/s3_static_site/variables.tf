variable "project_name" {
  type        = string
  description = "Project name for tagging"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name for the static site"
}

variable "site_dir" {
  type = string
}

