variable "domain" {}
variable "ttl" {
  default = 86400
}

# MX setup
# waiting on https://github.com/hashicorp/terraform/pull/9128
/*resource "dnsimple_record" "mx_aspmx" {
    domain = "${var.domain}"
    name = ""
    value = "aspmx.l.google.com."
    type = "MX"
    priority = 1
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "mx_alt1" {
    domain = "${var.domain}"
    name = ""
    value = "alt1.aspmx.l.google.com."
    type = "MX"
    priority = 5
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "mx_alt2" {
    domain = "${var.domain}"
    name = ""
    value = "alt2.aspmx.l.google.com."
    type = "MX"
    priority = 5
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "mx_alt3" {
    domain = "${var.domain}"
    name = ""
    value = "alt3.aspmx.l.google.com."
    type = "MX"
    priority = 10
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "mx_alt4" {
    domain = "${var.domain}"
    name = ""
    value = "alt4.aspmx.l.google.com."
    type = "MX"
    priority = 10
    ttl = "${var.ttl}"
}*/

# SPF
resource "dnsimple_record" "spf_spf" {
    domain = "${var.domain}"
    name = ""
    value = "v=spf1 a include:_spf.google.com ~all"
    type = "SPF"
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "spf_txt" {
    domain = "${var.domain}"
    name = ""
    value = "v=spf1 a include:_spf.google.com ~all"
    type = "TXT"
    ttl = "${var.ttl}"
}

# GSuite aliases
resource "dnsimple_record" "google_mail" {
    domain = "${var.domain}"
    name = "mail"
    value = "ghs.googlehosted.com"
    type = "CNAME"
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "google_calendar" {
    domain = "${var.domain}"
    name = "calendar"
    value = "ghs.googlehosted.com"
    type = "CNAME"
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "google_drive" {
    domain = "${var.domain}"
    name = "drive"
    value = "ghs.googlehosted.com"
    type = "CNAME"
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "google_sites" {
    domain = "${var.domain}"
    name = "sites"
    value = "ghs.googlehosted.com"
    type = "CNAME"
    ttl = "${var.ttl}"
}
resource "dnsimple_record" "google_groups" {
    domain = "${var.domain}"
    name = "groups"
    value = "ghs.googlehosted.com"
    type = "CNAME"
    ttl = "${var.ttl}"
}
