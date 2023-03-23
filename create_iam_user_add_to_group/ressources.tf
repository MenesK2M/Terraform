resource "aws_iam_user" "UserOne" {
  name = "Maxime"
}

resource "aws_iam_group" "mygroup" {
  name = "DevOpsEngineer"
}

resource "aws_iam_group_membership" "Maxime_group_membership" {
  name = "${aws_iam_group.mygroup.name}-${aws_iam_user.UserOne.name}"
  users = [
    aws_iam_user.UserOne.name,
  ]
  group = aws_iam_group.mygroup.name
}
