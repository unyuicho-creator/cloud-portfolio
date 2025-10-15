# 🧰 Cloud Portfolio on AWS (Terraform + GitHub Actions + OIDC)

このプロジェクトは、AWS 無料枠を活用して構築したクラウドポートフォリオです。  
**S3 + CloudFront(OAC)** による静的サイト配信と、**API Gateway + Lambda** によるサーバーレスAPIをTerraformでコード化。  
GitHub Actions（OIDC連携）で自動デプロイまで構築しました。

---

```mermaid
flowchart LR
    U((User))
    CF[CloudFront<br/>(OAC)]
    S3[(S3 Private Bucket)]
    APIGW[API Gateway<br/>(HTTP API)]
    LBD[Lambda<br/>(Python)]

    U --> CF
    CF --> S3
    U --> APIGW --> LBD


