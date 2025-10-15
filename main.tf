variable "project_name" { default = "cloud-portfolio" }
variable "index_html_path" { default = "./site/index.html" }
variable "lambda_source_dir" { default = "./lambda" }

# アカウントIDを使うなら必要（まだ無ければ追加）
data "aws_caller_identity" "current" {}


locals {
  project_name = "tf-portfolio" # 好きなプロジェクト名（小文字・英数・ハイフン）
}

module "static_site" {
  source          = "./modules/s3_static_site"
  project_name    = local.project_name
  index_html_path = "${path.root}/modules/s3_static_site/site/index.html"
  bucket_name     = "tf-portfolio-static-${data.aws_caller_identity.current.account_id}"
}



module "apigw_lambda" {
  source            = "./modules/apigw_lambda"
  project_name      = var.project_name
  lambda_source_dir = var.lambda_source_dir
}

output "cloudfront_domain" {
  value = module.static_site.cloudfront_domain
}

output "api_invoke_url" {
  value = module.apigw_lambda.api_invoke_url
}

