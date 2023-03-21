resource "aws_instance" "myfirst_ec2_from_terraform" {
  ami               = var.ami_linux
  availability_zone = var.aws_availability_zone
  instance_type     = var.instance_type
  key_name          = var.key_name_linux
  security_groups   = var.security_groups_linux
  tags = {
    "Name" = "linux server"
  }
}
