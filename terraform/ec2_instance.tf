resource "aws_instance" "example" {
  ami           = "ami-01938df366ac2d954"  # Pastikan AMI ID ini valid untuk region kamu
  instance_type = "t2.micro"

  key_name      = "pahmil"  # Pastikan key pair ini sudah ada di AWS EC2

  subnet_id     = aws_subnet.subnet.id
  security_groups = [aws_security_group.allow_ssh_http.id]  # Memperbaiki dengan menggunakan list

  tags = {
    Name = "example-instance"
  }
}
