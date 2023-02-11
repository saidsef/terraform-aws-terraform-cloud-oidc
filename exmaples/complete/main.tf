provider "aws" {
  region = var.region
}

module "terraform_cloud_oidc" {
  source = "../../"

  attach_admin_policy           = var.attach_admin_policy
  attach_read_only_policy       = var.attach_read_only_policy
  create_oidc_provider          = var.create_oidc_provider
  enabled                       = var.enabled
  force_detach_policies         = var.force_detach_policies
  organisation                  = var.organisation
  projects                      = var.projects
  iam_role_name                 = var.iam_role_name
  iam_role_path                 = var.iam_role_path
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  iam_role_policy_arns          = var.iam_role_policy_arns
  max_session_duration          = var.max_session_duration
  tags                          = var.tags
  url                           = var.url
}
