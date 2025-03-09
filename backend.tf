terraform {
  backend "s3" {
    bucket = "nithin-s3-terraform"
    key = "remote.tfstate"
    region = "ap-south-1"
  }
}
