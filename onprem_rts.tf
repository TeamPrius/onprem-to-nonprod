# route table for onprem public subnet
resource "aws_route_table" "onprem_transit_gateway_route" {
  vpc_id = aws_vpc.onprem.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.onprem_igw.id
  }

  route {
    cidr_block         = aws_vpc.nonprod.cidr_block       
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  }
}


#Create Public Route table associations

resource "aws_route_table_association" "onprem_internet_gateway_route_association" {
  subnet_id      = aws_subnet.public_subnet_onprem.id
  route_table_id = aws_route_table.onprem_transit_gateway_route.id
}

# route table for onprem private subnet
resource "aws_route_table" "onprem_pr_rt" {
  vpc_id = aws_vpc.onprem.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_onprem.id
  }
}


#Create Private Route table associations

resource "aws_route_table_association" "onprem_pr_rt_association" {
  subnet_id      = aws_subnet.private_subnet_onprem.id
  route_table_id = aws_route_table.onprem_pr_rt.id
}
