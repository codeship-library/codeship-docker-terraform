module "gsuite_codeshipexample" {
  source = "./gsuite"
  domain = "codeshipexample.io"
}

module "keybase_ooble" {
  source = "./keybase"
  domain = "codeshipexample.io"
  verification = ""
}
