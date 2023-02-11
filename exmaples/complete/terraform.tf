terraform {
  backend "remote" {
    organization = "saidsef"
    hostname     = "app.terraform.io"
    workspaces {
      name = "terraform-cloud"
    }
  }
}
