output "role_id" {
  description = "AWS Role ID"
  value       = aws_iam_role.role[0].id
  sensitive   = false
}

output "role_arn" {
  description = "AWS Role ARN"
  value       = aws_iam_role.role[0].arn
  sensitive   = false
}

output "projects" {
  description = "List of Terraform Cloud projects"
  value       = var.projects
  sensitive   = false
}
