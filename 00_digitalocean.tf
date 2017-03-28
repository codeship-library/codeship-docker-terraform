/*
 * digital ocean
 */
variable "digitalocean_token" {}

provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

resource "digitalocean_ssh_key" "codeship_example" {
  name = "@codeship_example"
  public_key = "${file("marko.pub")}"
}
