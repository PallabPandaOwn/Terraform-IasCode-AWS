# Internet VPC
resource "aws_vpc" "pallab-test-terraform" {
  cidr_block           = "10.0.0.0/16" # 2 power 16 - 65536 Ip address will be created
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "pallab-test-terraform"
  }
}

# Subnets - public 
resource "aws_subnet" "pallab-test-terraform-public-1" {
  vpc_id                  = aws_vpc.pallab-test-terraform.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "pallab-test-terraform-public-1"
  }
}

resource "aws_subnet" "pallab-test-terraform-public-2" {
  vpc_id                  = aws_vpc.pallab-test-terraform.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "pallab-test-terraform-public-2"
  }
}

resource "aws_subnet" "pallab-test-terraform-public-3" {
  vpc_id                  = aws_vpc.pallab-test-terraform.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "pallab-test-terraform-public-3"
  }
}

# subnet - private

resource "aws_subnet" "pallab-test-terraform-private-1" {
  vpc_id                  = aws_vpc.pallab-test-terraform.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "pallab-test-terraform-private-1"
  }
}

resource "aws_subnet" "pallab-test-terraform-private-2" {
  vpc_id                  = aws_vpc.pallab-test-terraform.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "pallab-test-terraform-private-2"
  }
}

resource "aws_subnet" "pallab-test-terraform-private-3" {
  vpc_id                  = aws_vpc.pallab-test-terraform.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "pallab-test-terraform-private-3"
  }
}


# Internet GW - it will aloow the public subnet to internet
resource "aws_internet_gateway" "pallab-test-terraform-igw" {
  vpc_id = aws_vpc.pallab-test-terraform.id

  tags = {
    Name = "pallab-test-terraform"
  }
}

# route tables
resource "aws_route_table" "pallab-test-terraform-public" {
  vpc_id = aws_vpc.pallab-test-terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pallab-test-terraform-igw.id
  }

  tags = {
    Name = "pallab-test-terraform-public-1"
  }
}

# route associations public subnet
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-3-a" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public.id
}