provider "aws" {
  region = var.region
}

module "terraform_oidc" {
  source  = "saidsef/terraform-oidc/aws"
  version = ">= 1"

  attach_admin_policy           = true
  attach_read_only_policy       = true
  create_oidc_provider          = true
  enabled                       = true
  force_detach_policies         = false
  organisation                  = "saidsef"
  projects                      = [{ "project" : "*", "workspaces" : ["*"], "run_phase" : "*" }]
  iam_role_name                 = "terraform-cloud"
  iam_role_path                 = "/"
  iam_role_permissions_boundary = ""
  iam_role_policy_arns          = []
  max_session_duration          = 3600
  tags                          = {}
  url                           = "app.terraform.io"
}
