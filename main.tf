terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "sctp-ce12-tfstate-bucket"
    key    = "test/yeosy-terraform.tfstate"
    region = "ap-southeast-1"
  }
}


provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "yeosy123-github-actions-test-bucket"

  tags = {
    Name        = "yeosy-github-actions-test-bucket"
    Environment = "test"
    ManagedBy   = "terraform"
  }
}

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.test_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.test_bucket.arn
}
