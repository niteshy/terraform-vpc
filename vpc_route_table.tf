

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

resource "aws_route_table_association" "rt" {
  subnet_id      = "${aws_subnet.subnet_public_1.id}"
  route_table_id = "${aws_route_table.route_public_igateway.id}"
}