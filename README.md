# Cloud Portfolio (AWS / Tokyo)
S3(非公開)+CloudFront(OAC)で静的サイト配信、API Gateway(HTTP)+Lambda(Python)でAPI公開。  
TerraformでフルIaC、GitHub Actions + OIDCでCI/CD。

## 構成概要
```mermaid
flowchart LR
  user((User)) --> CF[CloudFront]
  CF --> S3[(S3 Private Bucket)]
  user --> APIGW[API Gateway (HTTP API)] --> LBD[Lambda (Python 3.12)]

Update: least-privilege policy linked on 2025-10-15T05:33:50Z

