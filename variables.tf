variable "policy" {
    description = "JSCON Enconded policy statement."
    type = string
    default = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "NotAction" : [
          "organizations:*",
          "account:*"
        ],
        "Resource" : "*"
      },
    ]
  })
}

variable "allowed_orgs_and_repos" {
    description = "value"
    type = list
}