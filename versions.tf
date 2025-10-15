terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region

  # 任意：タグのデフォルト（ポートフォリオらしさを出す）
  default_tags {
    tags = {
      Project = "cloud-portfolio"
      Owner   = "github-actions"
      Env     = "dev"
    }
  }
}
