output "cloudfront_domain" { value = aws_cloudfront_distribution.site.domain_name }
output "api_invoke_url" { value = aws_apigatewayv2_stage.http.invoke_url }
