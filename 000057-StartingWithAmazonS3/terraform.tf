terraform {
  # required_version = "value"
}

provider "aws" {
  profile = var.profile
  region  = var.region
  default_tags {
    tags = var.default_tags
  }
}