provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "task_bucket" {
  bucket = "s3-task-using-terraform-ga"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_object" "sample_file" {
  bucket = aws_s3_bucket.task_bucket.bucket
  key    = "sample.txt"
  source = "sample.txt"
  acl    = "public-read"
}

output "bucket_name" {
  value = aws_s3_bucket.task_bucket.bucket
}
