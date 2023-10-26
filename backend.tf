terraform {
  backend "s3" {
    bucket         = "us-east-region-state-lock"
    key            = "hrms-demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "us-lock-state"
  }
}