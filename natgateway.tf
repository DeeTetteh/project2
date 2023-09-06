# Allocate elastic IP address
resource "aws_eip" "eip-nat-gateway" {
        domain = "vpc"
}




# Create Nat gateway in public subnet
resource "aws_nat_gateway" "Test-Nat-gateway" {
  allocation_id = aws_eip.eip-nat-gateway.id
  subnet_id     = aws_subnet.Test-public-sub1.id

  tags = {
    Name = "test-nat-gateway"
  }
}