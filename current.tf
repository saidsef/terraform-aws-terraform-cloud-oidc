locals {
  projects = flatten([
    for repo in var.projects : [
      for workspace in repo.workspaces : {
        workspace = workspace
        project   = repo.project
        run_phase = repo.run_phase
      }
    ]
  ])
}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      values   = [format("%s", one(aws_iam_openid_connect_provider.provider[0].client_id_list))]
      variable = format("%s:aud", var.url)
    }

    condition {
      test     = "ForAnyValue:StringLike"
      values   = [for org in local.projects : format("organization:%s:project:%s:workspace:%s:run_phase:%s", var.organisation, org.project, org.workspace, org.run_phase)]
      variable = format("%s:sub", var.url)
    }

    principals {
      identifiers = [local.oidc_provider.arn]
      type        = "Federated"
    }
  }

}

data "aws_iam_openid_connect_provider" "provider" {
  count = tobool(var.enabled) && !tobool(var.create_oidc_provider) ? 1 : 0

  url = format("https://%s", var.url)
}

data "tls_certificate" "provider" {
  url = format("https://%s", var.url)
}
