/*
 * AWS
 */
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region = "eu-central-1"
}

resource "aws_s3_bucket" "codeship-terraform" {
  bucket = "codeship-terraform"
  acl = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix = ""
    enabled = true

    noncurrent_version_transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }

  tags {
    project = "shipyard"
    environment = "production"
  }
}

resource "aws_dynamodb_table" "codeship-terraform" {
  name = "codeship-terraform"
  read_capacity = 1
  write_capacity = 1
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    project = "shipyard"
    environment = "production"
  }
}

resource "aws_kms_key" "terraform_state" {
  description = "terraform remote state encryption"
  deletion_window_in_days = 7

  tags {
    project = "shipyard"
    environment = "production"
  }
}
