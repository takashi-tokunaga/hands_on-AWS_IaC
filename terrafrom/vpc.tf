resource "aws_vpc" "vpc" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "test-iac-vpc"
  }
}

resource "aws_subnet" "subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "test-iac-subnet-1a"
  }
}


resource "aws_subnet" "subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.20.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "test-iac-subnet-1c"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "test-iac-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "test-iac-public-rt"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.subnet_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.subnet_1c.id
  route_table_id = aws_route_table.public.id
}