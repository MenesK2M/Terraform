resource "aws_iam_user" "myIamUser" {
  name = "Maxime"
}

resource "aws_iam_group" "mygroup" {
  name = "HR"
}

resource "aws_iam_group_membership" "Maxime_group_membership" {
  name = "${aws_iam_group.mygroup.name}-${aws_iam_user.myIamUser.name}"
  users = [
    aws_iam_user.myIamUser.name,
  ]
  group = aws_iam_group.mygroup.name
}