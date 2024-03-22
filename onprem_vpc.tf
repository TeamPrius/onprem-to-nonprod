# Create on Prem VPC

resource "aws_vpc" "onprem" {
  cidr_block = "192.168.0.0/24"  
  tags = {
     Name = "On-prem VPC"
  }
}

#Create Public Subnet 

resource "aws_subnet" "public_subnet_onprem" {
  vpc_id     = aws_vpc.onprem.id
  cidr_block = "192.168.0.0/25"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Public Subnet On-Prem"
  }
}

#Create Private Subnet 

resource "aws_subnet" "private_subnet_onprem" {
  vpc_id     = aws_vpc.onprem.id
  cidr_block = "192.168.0.128/25"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  
  tags = {
    Name = "Private Subnet On-Prem"
  }
}

# Create a NAT gateway
resource "aws_nat_gateway" "nat_gateway_onprem" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet_onprem.id

  tags = {
    Name = "On Prem NAT Gateway"
  }
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "my_eip" {
  vpc = true
}

