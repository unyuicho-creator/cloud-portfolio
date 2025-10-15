# 既存の GitHub Actions 用ロールを参照（エラーメッセージのロール名）
data "aws_iam_role" "github_actions" {
  name = "github-actions-terraform"
}

# API Gateway v2 ←→ CloudWatch Logs の Log Delivery に必要な権限
resource "aws_iam_policy" "apigw_logs_delivery" {
  name        = "apigw-logs-delivery"
  description = "Permissions for API Gateway (v2) access log delivery to CloudWatch Logs"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "ApiGwAccessLogsDelivery",
      Effect = "Allow",
      Action = [
        "logs:CreateLogDelivery",
        "logs:DeleteLogDelivery",
        "logs:UpdateLogDelivery",
        "logs:GetLogDelivery",
        "logs:ListLogDeliveries",
        "logs:PutResourcePolicy",
        "logs:DescribeResourcePolicies",
        "logs:DescribeLogGroups",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_apigw_logs" {
  role       = data.aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.apigw_logs_delivery.arn
}
