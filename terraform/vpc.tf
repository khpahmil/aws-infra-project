resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # CIDR block untuk VPC

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  # CIDR block untuk subnet
  availability_zone       = "us-east-1a"  # Pilih Availability Zone
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
