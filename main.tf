/**
 * Prepare account for Github actions connections
 * WARNING - This may be best moved into a separate repository that loops through accounts and the allowed repos.
 * This is especially true as this is more of a bootstrap process. :/
 */

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

//Lookup the current account 
data "aws_caller_identity" "current" {}

locals {
  //Convert list of trusted repos and org into json friendly string format.
  trusted_repos = jsonencode(var.trusted_repos)
}

//Create the trust policy that allows 
resource "aws_iam_role" "github" {
  name = "GitHubActionsRole"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
              "StringEquals" : {
                "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
              },
              "ForAnyValue:StringLike": { 
                "token.actions.githubusercontent.com:sub": ${local.trusted_repos}
              }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "github" {
  role       = aws_iam_role.github.name
  policy_arn = var.policy_arn
}