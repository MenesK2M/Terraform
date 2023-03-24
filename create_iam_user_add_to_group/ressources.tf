variable "users" {
  description = "here we have all the users that we want to create"
  type        = map(string)
  default = {
    UserOne  = "Maxime"
    UserTwo  = "Haward"
    UserTree = "Rabania"
    UserFour = "Francoise"
    UserFive = "Ozoya"
  }
}

resource "aws_iam_user" "createUsers" {
  for_each = var.users
  name     = each.value
}

resource "aws_iam_group" "mygroup" {
  name = "DevOpsEngineer"
}

resource "aws_iam_group_membership" "Maxime_group_membership" {
  for_each = var.users
  name     = aws_iam_group.mygroup.name
  users    = [ aws_iam_user.createUsers[each.key].name ]
  group    = aws_iam_group.mygroup.name
}
