
resource "aws_vpc" "detroit_vpc" {
  cidr_block           = var.detroit_vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.detroit_vpc
  }
}

#==================================================================
resource "aws_subnet" "detroit_vpc_web_subnet_0" {
  vpc_id                  = aws_vpc.detroit_vpc.id
  cidr_block              = var.detroit_web_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "detroit_vpc_web_subnet_0"
  }
}

resource "aws_subnet" "detroit_vpc_web_subnet_1" {
  vpc_id                  = aws_vpc.detroit_vpc.id
  cidr_block              = var.detroit_web_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "detroit_vpc_web_subnet_1"
  }
}

#==================================================

resource "aws_subnet" "detroit_vpc_app_subnet_0" {
  vpc_id                  = aws_vpc.detroit_vpc.id
  cidr_block              = var.detroit_app_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "detroit_vpc_app_subnet_0"
  }
}

resource "aws_subnet" "detroit_vpc_app_subnet_1" {
  vpc_id                  = aws_vpc.detroit_vpc.id
  cidr_block              = var.detroit_app_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "detroit_vpc_app_subnet_1"
  }
}

#=======================================================
resource "aws_subnet" "detroit_vpc_db_subnet_0" {
  vpc_id                  = aws_vpc.detroit_vpc.id
  cidr_block              = var.detroit_db_subnet_cidr_block[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "detroit_vpc_db_subnet_0"
  }
}

resource "aws_subnet" "detroit_vpc_db_subnet_1" {
  vpc_id                  = aws_vpc.detroit_vpc.id
  cidr_block              = var.detroit_db_subnet_cidr_block[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "detroit_vpc_db_subnet_1"
  }
}