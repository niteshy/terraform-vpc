
# security group for vpce
resource "aws_security_group" "sg_vpce" {
  name        = "sg_vpce"
  description = "Allow traffic within vpc"
  vpc_id      = "${aws_vpc.vpc_main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.vpc_main.cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["${aws_vpc.vpc_main.cidr_block}"]
  }
}