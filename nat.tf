# nat gw
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.pallab-test-terraform-public-1.id
  depends_on    = [aws_internet_gateway.pallab-test-terraform-igw]
}

# VPC setup for NAT
resource "aws_route_table" "pallab-test-terraform-private" {
  vpc_id = aws_vpc.pallab-test-terraform.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "pallab-test-terraform-private-NAT-1"
  }
}

# route associations private
resource "aws_route_table_association" "pallab-test-terraform-private-1-a" {
  subnet_id      = aws_subnet.pallab-test-terraform-private-1.id
  route_table_id = aws_route_table.pallab-test-terraform-private.id
}

resource "aws_route_table_association" "pallab-test-terraform-private-2-a" {
  subnet_id      = aws_subnet.pallab-test-terraform-private-2.id
  route_table_id = aws_route_table.pallab-test-terraform-private.id
}

resource "aws_route_table_association" "main-private-3-a" {
  subnet_id      = aws_subnet.pallab-test-terraform-private-3.id
  route_table_id = aws_route_table.pallab-test-terraform-private.id
}
