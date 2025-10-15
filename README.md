# 🧰 Cloud Portfolio on AWS (Terraform + GitHub Actions + OIDC)

このプロジェクトは **AWS 無料枠**を活用して構築したクラウドポートフォリオです。  
**S3 + CloudFront (OAC)** による静的サイト配信と、**API Gateway + Lambda** によるサーバーレスAPIを **Terraform** でコード化。  
さらに **GitHub Actions（OIDC連携）** によって自動デプロイまで構築しました。

---

## 🏗️ アーキテクチャ構成

```mermaid
flowchart LR
    U([ User ]) --> CF[/" CloudFront (OAC) "/]
    CF --> S3[( S3 Private Bucket )]
    U --> APIGW["API Gateway (HTTP API)"]
    APIGW --> LBD[[" Lambda (Python) "]]
