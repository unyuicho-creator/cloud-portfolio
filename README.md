# ☁️ AWS Serverless Portfolio (Terraform × CloudFront × Lambda)

個人で構築した **クラウドエンジニア転職アピール用ポートフォリオ** です。  
AWS無料枠を活用し、**静的サイト配信（S3 + CloudFront）** と **サーバーレスAPI（API Gateway + Lambda）** を **Terraform** により完全IaC化しました。  
CI/CD・セキュリティ・コスト意識を重視した実務志向の設計になっています。

---

## 🏗️ プロジェクト概要

| 項目 | 内容 |
|------|------|
| **目的** | AWS無料枠内で運用可能なクラウドアーキテクチャの構築 |
| **構成** | TerraformでAWSリソースを自動構築し、フロント＋APIを統合 |
| **主な特徴** | <ul><li>OAIを利用しS3を非公開のままCloudFront配信</li><li>API Gateway HTTP APIとLambdaによるサーバーレスAPI</li><li>CloudWatchでアクセス・実行ログを可視化</li><li>GitHub Actions（OIDC連携）を想定したCI/CD構成</li></ul> |
| **学習目的** | IaC / サーバーレス / AWSセキュリティベストプラクティスの理解 |
| **コスト意識** | EC2非使用・無料枠中心・ログ保持7日・S3パブリックブロック有効化 |

---

## ☁️ 使用AWSサービス

| サービス | リソース例 | 役割 |
|-----------|-------------|------|
| **S3** | `aws_s3_bucket.site` / `aws_s3_object.index` | 静的Webサイトホスティング（CloudFrontオリジン） |
| **CloudFront** | `aws_cloudfront_distribution.cdn` / `aws_cloudfront_origin_access_identity.oai` | HTTPS配信・OAI経由でS3非公開配信 |
| **Lambda** | `aws_lambda_function.hello` | Python 3.12によるサーバーレス関数（Hello API） |
| **API Gateway (HTTP)** | `aws_apigatewayv2_api.http` / `aws_apigatewayv2_route.get_root` | LambdaへのHTTPルーティング |
| **IAM** | `aws_iam_role.lambda_exec` / `aws_lambda_permission.allow_apigw` | Lambda実行権限・API呼び出し許可 |
| **CloudWatch Logs** | `aws_cloudwatch_log_group.api_access` / `aws_cloudwatch_log_group.lambda` | APIアクセスログ・Lambda実行ログ |
| **Terraform補助** | `data.archive_file.lambda_zip` | LambdaコードZIP自動生成 |

---

## 🔗 アーキテクチャ図

###全体像

```mermaid
flowchart LR
  User --> CF
  CF -->|origin| S3
  CF -. uses .- OAI
  OAI --> POL
  POL --> S3
  PAB --> S3
  IDX --> S3

  User --> APIGW
  APIGW --> ROUTE
  ROUTE --> INTG
  INTG --> LBD
  APIGW --> STG
  STG -. access logs .-> CW_API
  LBD -. logs .-> CW_LBD
  APIGW -. permission .-> LBD

  %% Labels
  CF[aws_cloudfront_distribution.cdn]
  OAI[aws_cloudfront_origin_access_identity.oai]
  S3[aws_s3_bucket.site]
  POL[aws_s3_bucket_policy.site]
  PAB[aws_s3_bucket_public_access_block.site]
  IDX[aws_s3_object.index]

  APIGW[aws_apigatewayv2_api.http]
  ROUTE[aws_apigatewayv2_route.get_root]
  INTG[aws_apigatewayv2_integration.lambda]
  STG[aws_apigatewayv2_stage.prod]
  LBD[aws_lambda_function.hello]
  CW_API[aws_cloudwatch_log_group.api_access]
  CW_LBD[aws_cloudwatch_log_group.lambda]
