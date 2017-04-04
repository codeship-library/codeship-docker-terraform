/*
 * terraform
 */
terraform {
  required_version = "> 0.9.0"

  backend "s3" {
    region = "us-east-1"
    bucket = "codeship-pro-terraform-state"
    key = "codeship-pro-terraform.tfstate"
    acl = "private"
    encrypt = "true"
    kms_key_id = "arn:aws:kms:us-east-1:870119404647:key/365c1a98-3e6c-46ca-a502-0238d36671af"
    lock_table = "codeship-pro-terraform-lock"
  }
}
