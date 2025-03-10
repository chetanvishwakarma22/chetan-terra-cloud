terraform {
  backend "s3" {
    bucket = "jta-1"
    key = "remote.tfstate"
    region = "ap-south-1"
  }
}
