provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "mykey" {
  description = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_s3_bucket" "sentinel-demo" {
  bucket   = "tf-sentinel-demo-bucket"
  acl      = "private"
  provider = "aws"
  region   = "us-west-1"

  versioning {
    enabled = true
  }
  lifecycle_rule {
     enabled = true

     transition {
       days = 30
       storage_class = "STANDARD_IA"
     }

     transition {
       days = 90
       storage_class = "GLACIER"
     }
   }
  server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          kms_master_key_id = "${aws_kms_key.mykey.arn}"
          sse_algorithm     = "aws:kms"
        }
      }
    }
}
