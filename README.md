# terraform-aws-githubactions-oidc
Allows Github Action to connect to your AWS account and with the permissions provided.

<!-- BEGIN_TF_DOCS -->
Prepare account for Github actions connections
WARNING - This may be best moved into a separate repository that loops through accounts and the allowed repos.
This is especially true as this is more of a bootstrap process. :/

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.67 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.67 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | ARN of policy. | `string` | n/a | yes |
| <a name="input_trusted_repos"></a> [trusted\_repos](#input\_trusted\_repos) | value | `list(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->