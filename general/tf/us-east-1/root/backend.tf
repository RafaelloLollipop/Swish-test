terraform {
  backend "s3" {
    bucket         = "terraform-state-storage-eks"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks-eks"
  }
}
