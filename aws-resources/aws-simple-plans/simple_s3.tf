terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "time_static" "now" {}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "alfiia-s3-simple-${replace(time_static.now.unix, "/[^0-9]/", "")}"
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}