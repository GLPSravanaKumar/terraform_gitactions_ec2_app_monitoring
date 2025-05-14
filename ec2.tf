locals {
  config_yaml         = templatefile("${path.module}/config.yaml.tmpl", {
    sns_topic_arn = aws_sns_topic.health_topic.arn
  })
  health_check_script = file("${path.module}/health_check.py")
}


resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/userdata.sh", {
    config_yaml         = local.config_yaml
    health_check_script = local.health_check_script
  })

  tags = {
    Name = "health-check-ec2"
  }
  
}