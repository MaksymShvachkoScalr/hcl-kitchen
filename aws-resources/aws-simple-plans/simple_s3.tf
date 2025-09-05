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
  count = 10
  bucket = "alfiia-s3-${count.index}-simple-${replace(time_static.now.unix, "/[^0-9]/", "")}"
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}

resource "aws_s3_bucket" "example2" {
  count = 1
  bucket = "alfiia-s3-2-${count.index}-simple-${replace(time_static.now.unix, "/[^0-9]/", "")}"
  force_destroy = true

  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}