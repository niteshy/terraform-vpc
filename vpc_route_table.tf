

resource "aws_route_table" "route_pvt_1" {
  vpc_id = "${aws_vpc.vpc_main.id}"

  tags = {
    Name = "route_pvt_1"
  }
}

resource "aws_route_table_association" "pvt_1" {
  subnet_id      = "${aws_subnet.subnet_private_1.id}"
  route_table_id = "${aws_route_table.route_pvt_1.id}"
}