provider "aws" {
  region = "eu-west-1"
}
resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami           = "ami-0015a39e4b7c0966f"
}
resource "aws_autoscaling_group" "my_asg" {
  availability_zones        = ["eu-west-1"]
  name                      = "2_my_asg"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration      = "my_web_config"
}
resource "aws_launch_configuration" "my_web_config" {
  name          = "my_web_config"
  image_id      = "ami-0015a39e4b7c0966f"
  instance_type = "t2.micro"
}

