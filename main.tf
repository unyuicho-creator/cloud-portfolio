variable "project_name" { default = "cloud-portfolio" }
variable "index_html_path" { default = "./site/index.html" }
variable "lambda_source_dir" { default = "./lambda" }

module "static_site" {
  source          = "./modules/s3_static_site"
  project_name    = var.project_name
  index_html_path = var.index_html_path
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

