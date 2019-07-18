
variable "anywhere" {
  default = "0.0.0.0/0"
}
variable "anywhere_ipv6" {
  default = "::/0"
}
resource "aws_network_acl" "private-subnet-acl" {
  tags = {
    Name = "private-subnet-acl"
  }
  vpc_id = "${aws_vpc.vpc_main.id}"
  subnet_ids = ["${aws_subnet.subnet_private_1.id}",
                "${aws_subnet.subnet_private_2.id}"]

 
  ingress {
    rule_no    = 100
    protocol   = -1
    from_port  = 0
    to_port    = 0
    cidr_block = "${aws_subnet.subnet_private_1.cidr_block}"
    action     = "allow"
  }
  ingress {
    rule_no    = 110
    protocol   = -1
    from_port  = 0
    to_port    = 0
    cidr_block = "${aws_subnet.subnet_private_2.cidr_block}"
    action     = "allow"
  }
  ingress {
    rule_no    = 200
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }

  egress {
    rule_no    = 100
    protocol   = 6
    from_port  = 443
    to_port    = 443
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  egress {
    rule_no    = 110
    protocol   = 6
    from_port  = 443
    to_port    = 443
    cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }

  egress {
    rule_no    = 200
    protocol   = 6
    from_port  = 80
    to_port    = 80
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  egress {
    rule_no    = 210
    protocol   = 6
    from_port  = 80
    to_port    = 80
    cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }
}


# resource "aws_network_acl" "redshift" {
#   tags = {
#     Name = "redshift-vpc-acl"
#   }
#   vpc_id = "${aws_vpc.main.id}"
#   subnet_ids = "${var.redshift_subnet_ids}"
#   ingress {
#     rule_no    = 100
#     protocol   = 6
#     action     = "allow"
#     cidr_block = "10.11.16.0/20"
#     from_port  = 5439
#     to_port    = 5439
#   }
#   ingress {
#     rule_no    = 110
#     protocol   = 6
#     action     = "allow"
#     cidr_block = "10.11.0.0/20"
#     from_port  = 5439
#     to_port    = 5439
#   }

#  egress {
#     rule_no    = 100
#     protocol   = 6
#     action     = "allow"
#     cidr_block = "10.11.16.0/20"
#     from_port  = 1024
#     to_port    = 65535
#   }
#   egress {
#     rule_no    = 110
#     protocol   = 6
#     action     = "allow"
#     cidr_block = "10.11.0.0/20"
#     from_port  = 1024
#     to_port    = 65535
#   }
# }

