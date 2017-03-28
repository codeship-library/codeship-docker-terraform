/*
 * dnsimple
 */
variable "dnsimple_token" {}
variable "dnsimple_account" {}

provider "dnsimple" {
 token = "${var.dnsimple_token}"
 account = "${var.dnsimple_account}"
}
