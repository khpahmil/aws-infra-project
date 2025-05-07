resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # CIDR block untuk VPC

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  # CIDR block untuk subnet
  availability_zone       = "ap-southeast-1a"  # Ganti ke salah satu AZ yang valid
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}
