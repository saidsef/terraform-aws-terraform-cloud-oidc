resource "aws_iam_role" "role" {
  count = tobool(var.enabled) ? 1 : 0

  assume_role_policy    = data.aws_iam_policy_document.assume_role.json
  description           = format("Role used by the %s Organisation.", var.organisation)
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  name                  = var.iam_role_name
  path                  = var.iam_role_path
  permissions_boundary  = var.iam_role_permissions_boundary != "" ? var.iam_role_permissions_boundary : null
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "admin" {
  count = tobool(var.enabled) && tobool(var.attach_admin_policy) ? 1 : 0

  policy_arn = format("arn:%s:iam::aws:policy/AdministratorAccess", data.aws_partition.current.partition)
  role       = aws_iam_role.role[0].id
}

resource "aws_iam_role_policy_attachment" "read_only" {
  count = tobool(var.enabled) && tobool(var.attach_read_only_policy) ? 1 : 0

  policy_arn = format("arn:%s:iam::aws:policy/ReadOnlyAccess", data.aws_partition.current.partition)
  role       = aws_iam_role.role[0].id
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = tobool(var.enabled) ? length(var.iam_role_policy_arns) : 0

  policy_arn = var.iam_role_policy_arns[count.index]
  role       = aws_iam_role.role[0].id
}

resource "aws_iam_openid_connect_provider" "provider" {
  count          = tobool(var.enabled) && tobool(var.create_oidc_provider) ? 1 : 0
  client_id_list = var.provider_client_id_list

  tags            = var.tags
  thumbprint_list = [data.tls_certificate.provider.certificates[0].sha1_fingerprint]
  url             = format("https://%s", var.url)
}
