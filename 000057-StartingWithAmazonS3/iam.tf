# Use for Github Actions
data "aws_iam_policy_document" "s3PutObject" {
  version   = "2012-10-17"
  statement {
    sid = "VisualEditor0"
    actions = [
      "s3:PutObject",
    ]
    resources = ["${aws_s3_bucket.this.arn}/*"]
  }
}

data "aws_iam_policy_document" "githubaction" {
  version   = "2012-10-17"
  statement {
    sid = "VisualEditor0"
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]
    resources = ["arn:aws:iam::708405720432:role/token.actions.githubusercontent.com"]
  }
}

data "aws_iam_policy_document" "github_assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::708405720432:oidc-provider/token.actions.githubusercontent.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "GithubAcS3" {
  name               = "AssumeRoleGitHubActionsWithS3"
  assume_role_policy = data.aws_iam_policy_document.github_assume_role_policy.json
  inline_policy {
    name = "putS3object-tf"
    policy = data.aws_iam_policy_document.s3PutObject.json
  }
  inline_policy {
    name = "GitHubActions-tf"
    policy = data.aws_iam_policy_document.githubaction.json
  }
}