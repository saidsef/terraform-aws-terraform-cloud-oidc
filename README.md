# Terraform AWS Terraform OIDC Provider
[![CI](https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-aws-terraform-cloud-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)

This Terraform module enables you to configure Terraform Cloud as an AWS IAM OIDC identity provider in AWS, which enables Terraform Cloud to access resources within an AWS account(s) without requiring long-lived credentials to be stored as Terraform Cloud Variables.

## Prerequisites

- AWS Account(s) and credentials
- Terraform Cloud Account(s)
- GitHub repository
- Terraform >= 1.x
- Profit?

## Deployment / Usage

```terraform
provider "aws" {
  region = var.region
}

module "terraform_cloud" {
  source  = "saidsef/terraform-cloud-oidc/aws"
  version = ">= 1"

  attach_read_only_policy = true
  organisation     = "saidsef"
  projects         = [{ "project" : "foo", "workspaces" : ["*"], "run_phase" : "*" }]
  tags             = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## Terraform Cloud Configure trust variables

After you have create a workspace, navigate to the Variables page and add the following variables:

| Category | Key | Value | Sensitive | Required |
| -------- | --- | ----- | --------- | -------- |
| Environment variable | TFC_AWS_PROVIDER_AUTH | true | false | Yes |
| Environment variable | TFC_AWS_RUN_ROLE_ARN  | role_arn | false | Yes |
| Environment variable | TFC_AWS_PLAN_ROLE_ARN | role_arn | false | No |
| Environment variable | TFC_AWS_APPLY_ROLE_ARN | role_arn | false | No |
| Environment variable | TFC_AWS_WORKLOAD_IDENTITY_AUDIENCE | `aws.workload.identity` | false | No |

## Source

Our latest and greatest source of `terraform-aws-terraform-cloud-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/fork). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.
