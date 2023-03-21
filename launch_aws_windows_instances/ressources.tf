resource "aws_instance" "myfirst_ec2_from_terraform" {
  ami               = var.ami_windows
  availability_zone = var.aws_availability_zone
  instance_type     = var.instance_type
  key_name          = var.key_name_windows
  security_groups   = var.security_groups_Windows
  tags = {
    "Name" = "Windows server"
  }
}
