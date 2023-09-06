#Create vpc
resource "aws_vpc" "Prod-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "Prod-vpc"
  }
}

# Create public and private subnets
resource "aws_subnet" "Test-public-sub1" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.Test-public-sub1-cidr_block

  tags = {
    Name = "test-public-sub1"
  }
}

resource "aws_subnet" "Test-public-sub2" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.Test-public-sub2-cidr_block

  tags = {
    Name = "test-public-sub1"
  }
}

resource "aws_subnet" "Test-priv-sub1" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.Test-priv-sub1-cidr_block

  tags = {
    Name = "tes-priv-sub1"
  }
}

resource "aws_subnet" "Test-priv-sub2" {
  vpc_id     = aws_vpc.Prod-vpc.id
  cidr_block = var.Test-priv-sub2-cidr_block

  tags = {
    Name = "test-priv-sub2"
  }
}

# Create public and private route tables
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-vpc.id

  tags = {
    Name = "testpubroutetable"
  }
}

resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Test-Nat-gateway.id
  }

  tags = {
    Name = "testprivroutetable"
  }
}

# Route table association to subnets
resource "aws_route_table_association" "Test-pub-route-tabl-eassociation1" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "Test-pub-route-table-association2" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "Test-priv-route-table-association1" {
  subnet_id      = aws_subnet.Test-priv-sub1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

resource "aws_route_table_association" "Test-priv-route-table-association2" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# Create internet gateway
resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-vpc.id

  tags = {
    Name = "Test-igw"
  }
}

# Internet gateway association with public route table
resource "aws_route" "Test-igw-association" {
  route_table_id            = aws_route_table.Test-pub-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.Test-igw.id
}