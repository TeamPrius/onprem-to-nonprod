#Create Security Group for on Prem instance
resource "aws_security_group" "onprem_sg" {
  name        = "app_sg"
  description = "Security Group for the onprem EC2"
  vpc_id      = aws_vpc.onprem.id

  tags = {
    Name = "onprem EC2"
  }
}

# ingress rules
resource "aws_vpc_security_group_ingress_rule" "onprem_sg_ingr" {
  security_group_id = aws_security_group.onprem_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ingress rules
#resource "aws_vpc_security_group_ingress_rule" "https_nonprod_sg_ingr" {
#  security_group_id = aws_security_group.nonprod_sg.id
#  cidr_ipv4         = "0.0.0.0/0"
#  from_port         = 443
#  ip_protocol       = "tcp"
#  to_port           = 443
#}

#resource "aws_vpc_security_group_ingress_rule" "http_nonprod_sg_ingr" {
#  security_group_id = aws_security_group.nonprod_sg.id
#  cidr_ipv4         = "0.0.0.0/0"
#  from_port         = 80
#  ip_protocol       = "tcp"
#  to_port           = 80
#}


#resource "aws_vpc_security_group_ingress_rule" "icmp_nonprod_sg_ingr" {
#  security_group_id = aws_security_group.nonprod_sg.id
#  cidr_ipv4         = "0.0.0.0/0"
#  from_port         = 8
#  ip_protocol       = "icmp"
#  to_port           = 0
#}



#Outbound rule
resource "aws_vpc_security_group_egress_rule" "onprem_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.onprem_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
