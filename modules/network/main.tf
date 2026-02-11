resource "aws_vpc" "this_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name_prefix}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_availability_zone
  tags = {
    Name = "${var.name_prefix}-private-subnet"
  }
}

resource "aws_internet_gateway" "this_igw" {
  vpc_id = aws_vpc.this_vpc.id
  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this_vpc.id
  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.this_igw.id
  }
  tags = {
    Name = "${var.name_prefix}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
