terraform {
  backend "s3" {
    bucket = "jta-bucket-1"
    key = "remote.tfstate"
    region = "ap-south-1"
  }
}
