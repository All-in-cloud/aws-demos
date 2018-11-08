terraform {
  backend "s3" {
    bucket = "terraformbackendvvc"
    key    = "statefile"
    region = "eu-central-1"
  }
}
