# Launch ec2 servers with ubuntu in public subnet
resource "aws_instance" "Test-serve-1" {
 ami                         = var.Test-serve-1-ami
 instance_type               = var.Test-serve-1-instance_type
 key_name                    = "dee2-kp"
 vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
 subnet_id                   = aws_subnet.Test-public-sub1.id


 tags = {
  Name = "test-serve-1"
 }
}

# Launch ec2 server with ubuntu in private subnet
resource "aws_instance" "Test-serve-2" {
 ami                         = var.Test-serve-2-ami
 instance_type               = var.Test-serve-2-instance_type
 key_name                    = "dee2-kp"
 vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
 subnet_id                   = aws_subnet.Test-priv-sub1.id


 tags = {
  Name = "test-serve-2"
 }
}