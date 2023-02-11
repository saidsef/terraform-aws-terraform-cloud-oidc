## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_oidc"></a> [terraform\_oidc](#module\_terraform\_oidc) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_admin_policy"></a> [attach\_admin\_policy](#input\_attach\_admin\_policy) | Enable attachment of the AdministratorAccess policy | `bool` | `false` | no |
| <a name="input_attach_read_only_policy"></a> [attach\_read\_only\_policy](#input\_attach\_read\_only\_policy) | Enable attachment of the ReadOnly policy | `bool` | `true` | no |
| <a name="input_create_oidc_provider"></a> [create\_oidc\_provider](#input\_create\_oidc\_provider) | Enable creation of the OIDC provider | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable creation of resources | `bool` | `true` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Force detachment of policies attached to the IAM role | `string` | `false` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role | `string` | `"terraform-cloud"` | no |
| <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path) | Path to the IAM role | `string` | `"/"` | no |
| <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary) | ARN of the permissions boundary to be used by the IAM role | `string` | `""` | no |
| <a name="input_iam_role_policy_arns"></a> [iam\_role\_policy\_arns](#input\_iam\_role\_policy\_arns) | List of IAM policy ARNs to attach to the IAM role | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum session duration in seconds | `number` | `3600` | no |
| <a name="input_organisation"></a> [organisation](#input\_organisation) | Organisation name | `string` | `"saidsef"` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | List of Workspaces and run\_phase or patterns | <pre>list(object({<br>    project    = string<br>    run_phase  = string<br>    workspaces = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "project": null,<br>    "run_phase": null,<br>    "workspaces": null<br>  }<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region name | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_url"></a> [url](#input\_url) | URL of identity provider | `string` | `"app.terraform.io"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | AWS action role ARN |
