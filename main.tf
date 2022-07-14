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

resource "aws_iam_role" "github" {
  name = "GitHubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = {
      Effect = "Allow"
      Action = [
        "sts:AssumeRoleWithWebIdentity"
      ]
      Principal = {
        Federated = aws_iam_openid_connect_provider.github.arn
      }
      Condition = {
        StringLike = { concat(["token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"],var.allowed_orgs_and_repo)
        }
      }
    }
  })
}

resource "aws_iam_role_policy_attachment" "github" {
  role       = aws_iam_role.github.name
  policy_arn = var.policy_arn
}