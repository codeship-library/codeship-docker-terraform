module "gsuite_codeship" {
  source = "./gsuite"
  domain = "codeship.at"
}

module "keybase_codeship" {
  source = "./keybase"
  domain = "codeship.at"
  verification = ""
}

resource "dnsimple_record" "codeship_at" {
  domain = "codeship.at"
  name = ""
  value = "codeship.github.io"
  type = "ALIAS"
  ttl = "3600"
}
resource "dnsimple_record" "www_codeship_at" {
  domain = "codeship.at"
  name = "www"
  value = "codeship.at"
  type = "CNAME"
  ttl = "3600"
}
