# Terraform AWS Terraform OIDC Provider
[![CI](https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/actions/workflows/ci.yaml/badge.svg)](#deployment--usage) ![GitHub issues](https://img.shields.io/github/issues-raw/saidsef/terraform-aws-terraform-cloud-oidc) [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE.md)

This Terraform module enables you to configure Terraform Cloud as an AWS IAM OIDC identity provider in AWS, which enables Terraform Cloud to access resources within an AWS account(s) without requiring long-lived credentials to be stored as Terraform Cloud Variables.

## Prerequisites

- AWS Account(s) and credentials
- GitHub repository
- Terraform >= 1.x

## Deployment / Usage

```terraform
provider "aws" {
  region = var.region
}

module "terraform_cloud" {
  source  = "saidsef/terraform-cloud-oidc/aws"
  version = "~> 2"

  attach_read_only_policy = true
  organisation     = "saidsef"
  projects         = [{ "project" : "foo", "workspaces" : ["*"], "run_phase" : "*" }]
  tags             = var.tags
}
```

## Provider Specifications and Requirements

Please see [TERRAFORM.md](./TERRAFORM.md)

## GitHub Actions

Retrieve temporary credentials:

https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/blob/29d6020587d06986388d84b2d10cbe266a1ea484/.github/workflows/ci.yaml#L79-L94

## Source

Our latest and greatest source of `terraform-aws-terraform-cloud-oidc` can be found on [GitHub](https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/fork). Fork us!

## Contributing

We would :heart: you to contribute by making a [pull request](https://github.com/saidsef/terraform-aws-terraform-cloud-oidc/pulls).

Please read the official [Contribution Guide](./CONTRIBUTING.md) for more information on how you can contribute.
