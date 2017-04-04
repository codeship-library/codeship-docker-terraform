/*
 * AWS
 */
variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

provider "aws" {
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
  region = "us-east-1"
}

resource "aws_s3_bucket" "remote-state-bucket" {
  bucket = "codeship-pro-terraform-state"
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

    noncurrent_version_expiration {
      days = 60
    }
  }

  tags {
    project = "codeship-pro-terraform-example"
    environment = "production"
    owner = "customer-success"
  }
}

resource "aws_dynamodb_table" "remote-state-lock" {
  name = "codeship-pro-terraform-lock"
  read_capacity = 1
  write_capacity = 1
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    project = "codeship-pro-terraform-example"
    environment = "production"
    owner = "customer-success"
  }
}

resource "aws_kms_key" "terraform_state_encryption_key" {
  description = "Codeship Pro Terraform example, remote state encryption key"
  deletion_window_in_days = 7

  tags {
    project = "codeship-pro-terraform-example"
    environment = "production"
    owner = "customer-success"
  }
}
