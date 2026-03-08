resource "aws_vpc" "vpc" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "test-iac-vpc"
  }
}

resource "aws_subnet" "subnet_1a" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.20.1.0/24"
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "test-iac-subnet-1a"
  }
}


resource "aws_subnet" "subnet_1c" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.20.2.0/24"
  availability_zone = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "test-iac-subnet-1c"
  }
}