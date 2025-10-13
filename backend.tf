terraform {
  backend "s3" {
    bucket         = "tfstate-249896948893-ap-northeast-1"
    key            = "tf-portfolio/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}
