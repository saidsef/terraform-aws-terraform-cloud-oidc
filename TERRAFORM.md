## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.read_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_openid_connect_provider.provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [tls_certificate.provider](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

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
| <a name="input_organisation"></a> [organisation](#input\_organisation) | Terraform Cloud Organisation name | `string` | `"saidsef"` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | List of Workspaces and run\_phase or patterns | <pre>list(object({<br>    project    = string<br>    run_phase  = string<br>    workspaces = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "project": null,<br>    "run_phase": null,<br>    "workspaces": null<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_url"></a> [url](#input\_url) | URL of identity provider | `string` | `"app.terraform.io"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_projects"></a> [projects](#output\_projects) | List of projects |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | AWS role ARN |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | AWS role ID |
