# 🧰 Cloud Portfolio on AWS (Terraform + GitHub Actions + OIDC)

このプロジェクトは、AWS 無料枠を活用して構築したクラウドポートフォリオです。  
**S3 + CloudFront(OAC)** による静的サイト配信と、**API Gateway + Lambda** によるサーバーレスAPIをTerraformでコード化。  
GitHub Actions（OIDC連携）で自動デプロイまで構築しました。

---

## 🏗️ アーキテクチャ

```mermaid
flowchart LR
  U[User] --> CF[CloudFront (OAC)]
  CF --> S3[(S3 Private Bucket)]
  U --> APIGW[API Gateway (HTTP API)] --> LBD[Lambda (Python)]
