/*
 * terraform
 */
terraform {
  required_version = "> 0.9.0"

  /*backend "s3" {
    region = "us-east-1"
    bucket = "codeship-pro-terraform-state"
    key = "codeship-pro-terraform.tfstate"
    acl = "private"
    encrypt = "true"
    kms_key_id = ""
    lock = "true"
    lock_table = "codeship-pro-terraform-lock"
  }*/
}
