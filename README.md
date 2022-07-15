# terraform-aws-githubactions-oidc
Allows Github Action to connect to your AWS account and with the permissions provided.

<!-- BEGIN_TF_DOCS -->
Prepare account for Github actions connections
WARNING - This may be best moved into a separate repository that loops through accounts and the allowed repos.
This is especially true as this is more of a bootstrap process. :/

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_orgs_and_repos"></a> [allowed\_orgs\_and\_repos](#input\_allowed\_orgs\_and\_repos) | value | `list` | n/a | yes |
| <a name="input_policy_arn"></a> [policy\_arn](#input\_policy\_arn) | ARN of policy. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->