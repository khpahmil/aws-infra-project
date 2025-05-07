
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.0"

  name          = "my-ec2"
  ami           = "ami-0c02fb55956c7d316" # Ubuntu 22.04 (region-dependent)
  instance_type = "t2.micro"

  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = var.subnet_id

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
