resource "aws_iam_user" "UserOne" {
  name = "Maxime"
}

resource "aws_iam_user" "UserTwo" {
  name = "Haward"
}

resource "aws_iam_user" "UserTree" {
  name = "Staline"
}

resource "aws_iam_user" "UserFour" {
  name = "Francoise"
}

resource "aws_iam_user" "UserFive" {
  name = "Ozoya"
}

resource "aws_iam_group" "mygroup" {
  name = "DevOpsEngineer"
}

resource "aws_iam_group_membership" "Maxime_group_membership" {
  name = aws_iam_group.mygroup.name
  users = [
    aws_iam_user.UserOne.name, aws_iam_user.UserTwo.name, aws_iam_user.UserTree.name, aws_iam_user.UserFour.name, aws_iam_user.UserFive.name
  ]
  group = aws_iam_group.mygroup.name
}
