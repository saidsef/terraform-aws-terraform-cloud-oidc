variable "region" {
  default     = "eu-west-1"
  description = "AWS Region name"
  type        = string
}

variable "attach_admin_policy" {
  default     = false
  description = "Enable attachment of the AdministratorAccess policy"
  type        = bool
}

variable "attach_read_only_policy" {
  default     = true
  description = "Enable attachment of the ReadOnly policy"
  type        = bool
}

variable "create_oidc_provider" {
  default     = true
  description = "Enable creation of the OIDC provider"
  type        = bool
}

variable "enabled" {
  default     = true
  description = "Enable creation of resources"
  type        = bool
}

variable "force_detach_policies" {
  default     = false
  description = "Force detachment of policies attached to the IAM role"
  type        = string
}

variable "organisation" {
  default     = "saidsef"
  description = "Organisation name"
  type        = string
}

variable "projects" {
  type = list(object({
    project    = string
    run_phase  = string
    workspaces = list(string)
  }))
  default = [{
    project    = null
    run_phase  = null
    workspaces = null
  }]
  description = "List of Workspaces and run_phase or patterns"
}

variable "iam_role_name" {
  default     = "terraform-cloud"
  description = "Name of the IAM role"
  type        = string
}

variable "iam_role_path" {
  default     = "/"
  description = "Path to the IAM role"
  type        = string
  sensitive   = false
}

variable "iam_role_permissions_boundary" {
  default     = ""
  description = "ARN of the permissions boundary to be used by the IAM role"
  type        = string
  sensitive   = false
}

variable "iam_role_policy_arns" {
  default     = []
  description = "List of IAM policy ARNs to attach to the IAM role"
  type        = list(string)
  sensitive   = false
}

variable "max_session_duration" {
  default     = 3600
  description = "Maximum session duration in seconds"
  type        = number
  sensitive   = false

  validation {
    condition     = var.max_session_duration >= 3600 && var.max_session_duration <= 43200
    error_message = "Session duration must be between 3600 and 43200 seconds."
  }
}

variable "url" {
  type        = string
  description = "URL of identity provider"
  default     = "app.terraform.io"
  sensitive   = false
}

variable "tags" {
  default     = {}
  description = "Map of tags to be applied to all resources"
  type        = map(string)
  sensitive   = false
}
