/*
 * terraform
 */
terraform {
  required_version = "> 0.9.0"

  backend "s3" {
    region = "eu-central-1"
    bucket = "codeship-terraform"
    key = "codeshipexample.tfstate"
    acl = "private"
    encrypt = "true"
    kms_key_id = ""
    lock = "true"
    lock_table = "codeship-terraform"
  }
}
