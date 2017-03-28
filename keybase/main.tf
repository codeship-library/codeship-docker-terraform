variable "domain" {}
variable "verification" {}
variable "ttl" {
  default = 259200
}

# Keybase
resource "dnsimple_record" "keybase_verification" {
    domain = "${var.domain}"
    name = ""
    value = "keybase-site-verification=${var.verification}"
    type = "TXT"
    ttl = "${var.ttl}"
}
