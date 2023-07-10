output "role_arn" {
  description = "AWS action role ARN"
  sensitive   = false
  value       = module.terraform_cloud_oidc.role_arn
}
