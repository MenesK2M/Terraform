variable "aws_region" {
  description = "The designated AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_windows" {
  description = "This is the windows ami"
  type        = string
  default     = "ami-0e38fa17744b2f6a5"
}

variable "ami_linux" {
  description = "This is the linux ami"
  type        = string
  default     = "ami-0dfcb1ef8550277af"
}

variable "aws_availability_zone" {
  description = "The AWS availibility zone"
  type        = string
  default     = "us-east-1e"
}

variable "instance_type" {
  description = "The AWS instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name_windows" {
  description = "Tis is the Key_pair for windows"
  type        = string
  default     = "AUE1-WINDOWS-SERVER"
}

variable "key_name_linux" {
  description = "Tis is the Key_pair for linux"
  type        = string
  default     = "AUE1-WEB-LINUX"
}

variable "security_groups_linux" {
  description = "This is the security group that allow ssh and http"
  default     = ["launch-SSH-ACCESS"]
}

variable "security_groups_Windows" {
  description = "This is the security group that allow RDP and http"
  default     = ["launch-wizard-1"]
}

variable "jenkins_installation" {
  type        = string
  description = "this is the configuration taht will install jenkins"
  default     = <<-EOF
  #!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y java-openjdk11
sudo yum install -y git
sudo mkdir /opt/maven
cd /opt/maven
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz
sudo tar -xvzf /opt/maven/apache-maven-3.9.0-bin.tar.gz
sudo mv apache-maven-3.9.0 maven39
sudo rm -rf apache-maven-3.9.0-bin.tar.gz
sed -i '10d' /home/ec2-user/.bash_profile
sed -i '8 aJAVA_HOME=/usr/lib/jvm/jre-11-openjdk-11.0.18.0.10-1.amzn2.0.1.x86_64\n\nM2_HOME=/opt/maven/maven39\n\nPATH=$HOME/.local/bin:$HOME/bin:$JAVA_HOME:$M2_HOME/bin:$PATH' /home/ec2-user/.bash_profile
/home/ec2-user/.bash_profile
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key 
sudo yum install -y jenkins
java -version
echo "-------------"
mvn --version
sudo systemctl start jenkins
sudo systemctl enable jenkins
EOF
}