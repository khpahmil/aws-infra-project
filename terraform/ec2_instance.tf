resource "aws_instance" "example" {
  ami           = "ami-00197bff829c798a8AMI"
  instance_type = "t2.micro"

  key_name = "pahmil"

  subnet_id = aws_subnet.subnet.id
  security_group = aws_security_group.allow_ssh_http.id

  tags = {
    Name = "example-instance"
  }
}
