data "aws_availability_zones" "name" {
  state = "available"
}

locals {
  config_yaml         = templatefile("${path.module}/config.yaml", {
    sns_topic_arn = aws_sns_topic.health_topic.arn
  })
  health_check_script = file("${path.module}/health_check.py")
}


resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true 
  enable_dns_hostnames = true
    
  tags = {
    Name = "glps-vpc"
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = element(data.aws_availability_zones.name.names, 0)
  tags = {
    Name = "glps-subnet"
  }
}

resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.name.id
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/userdata.sh", {
    config_yaml         = local.config_yaml
    health_check_script = local.health_check_script
  })

  tags = {
    Name = "health-check-ec2"
  }
  depends_on = [ aws_iam_instance_profile.ec2_profile, aws_vpc.vpc, aws_subnet.name ]

  
}