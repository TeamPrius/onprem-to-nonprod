# Routes public subnet on prem to nonprod

resource "aws_route" "onprem_to_nonprod" {
    route_table_id		= "${aws_route_table.onprem_transit_gateway_route.id}"
    destination_cidr_block	= "${aws_vpc.nonprod.cidr_block}"
    transit_gateway_id		= "${aws_ec2_transit_gateway.transit_gateway.id}"
}

# Routes nonprod to public subnet on prem

resource "aws_route" "nonprod_to_onprem" {
    route_table_id		= "${aws_route_table.nonprod_private_subnet_rt.id}"
    destination_cidr_block	= "${aws_vpc.onprem.cidr_block}"
    transit_gateway_id		= "${aws_ec2_transit_gateway.transit_gateway.id}"
}


