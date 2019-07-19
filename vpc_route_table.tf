

resource "aws_route_table" "route_public_igateway" {
  vpc_id = "${aws_vpc.vpc_main.id}"

  route {
    cidr_block = "${var.anywhere}"
    gateway_id = "${aws_internet_gateway.public_igateway.id}"
  }
  tags = {
    Name = "route_public_igateway"
    createdBy = "${var.createdBy}"
  }
}

# public igw route 
resource "aws_route_table_association" "rt" {
  subnet_id      = "${aws_subnet.subnet_public_1.id}"
  route_table_id = "${aws_route_table.route_public_igateway.id}"
}

resource "aws_route_table" "route_vpce" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  tags = {
    Name = "route_vpce"
    createdBy = "${var.createdBy}"
  }
}
# private-1 subnet route 
resource "aws_route_table_association" "rt_pvt1" {
  subnet_id      = "${aws_subnet.subnet_private_1.id}"
  route_table_id = "${aws_route_table.route_vpce.id}"
}
# private-1 subnet route 
resource "aws_route_table_association" "rt_pvt2" {
  subnet_id      = "${aws_subnet.subnet_private_2.id}"
  route_table_id = "${aws_route_table.route_vpce.id}"
}