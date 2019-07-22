
variable "anywhere" {
  default = "0.0.0.0/0"
}
variable "anywhere_ipv6" {
  default = "::/0"
}

# public network acl 
resource "aws_network_acl" "public-subnet-acl" {
  tags = {
    Name = "public-subnet-acl"
    createdBy = "${var.createdBy}"
  }
  vpc_id = "${aws_vpc.vpc_main.id}"
  subnet_ids = ["${aws_subnet.subnet_public_1.id}"]

  # Port 443 from anywhere
  ingress {
    rule_no    = 100
    protocol   = 6
    from_port  = 443
    to_port    = 443
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  # Port 443 from anywhere ipv6
  ingress {
    rule_no    = 110
    protocol   = 6
    from_port  = 443
    to_port    = 443
    ipv6_cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }

  # Port 80 from anywhere
  ingress {
    rule_no    = 200
    protocol   = 6
    from_port  = 80
    to_port    = 80
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  # Port 80 from anywhere ipv6
  ingress {
    rule_no    = 210
    protocol   = 6
    from_port  = 80
    to_port    = 80
    ipv6_cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }

  # ephermal port from anywhere
  ingress {
    rule_no    = 900
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }

   # All traffic to anywhere
  egress {
    rule_no    = 200
    protocol   = -1
    from_port  = 0
    to_port    = 0
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  # All traffic to anywhere ipv6
  egress {
    rule_no    = 210
    protocol   = -1
    from_port  = 0
    to_port    = 0
    ipv6_cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }
}

# private network acl 
resource "aws_network_acl" "private-subnet-acl" {
  tags = {
    Name = "private-subnet-acl"
    createdBy = "${var.createdBy}"
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
    rule_no    = 900
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }


  # Allow connecting to Redshift (5439) 
  egress {
    rule_no    = 90
    protocol   = 6
    from_port  = 5439
    to_port    = 5439
    cidr_block = "${aws_subnet.subnet_private_redshift.cidr_block}"
    action     = "allow"
  }
  # Port 443 from anywhere
  egress {
    rule_no    = 100
    protocol   = 6
    from_port  = 443
    to_port    = 443
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  # Port 443 from anywhere ipv6
  egress {
    rule_no    = 110
    protocol   = 6
    from_port  = 443
    to_port    = 443
    ipv6_cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }

  # Port 80 from anywhere
  egress {
    rule_no    = 200
    protocol   = 6
    from_port  = 80
    to_port    = 80
    cidr_block = "${var.anywhere}"
    action     = "allow"
  }
  # Port 80 from anywhere ipv6
  egress {
    rule_no    = 210
    protocol   = 6
    from_port  = 80
    to_port    = 80
    ipv6_cidr_block = "${var.anywhere_ipv6}"
    action     = "allow"
  }

  # Ephermal Port from subnet_private_1
  egress {  
    rule_no    = 300
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${aws_subnet.subnet_private_1.cidr_block}"
    action     = "allow"
  }
  # Ephermal Port from subnet_private_2
  egress {  
    rule_no    = 310
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${aws_subnet.subnet_private_2.cidr_block}"
    action     = "allow"
  }
}

# redshift network acl 
resource "aws_network_acl" "private-redshift_subnet-acl" {
  tags = {
    Name = "private-redshift_subnet-acl"
    createdBy = "${var.createdBy}"
  }
  vpc_id = "${aws_vpc.vpc_main.id}"
  subnet_ids = ["${aws_subnet.subnet_private_redshift.id}"]

  ingress {
    rule_no    = 100
    protocol   = 6
    from_port  = 5439
    to_port    = 5439
    cidr_block = "${aws_subnet.subnet_private_1.cidr_block}"
    action     = "allow"
  }
  ingress {
    rule_no    = 110
    protocol   = 6
    from_port  = 5439
    to_port    = 5439
    cidr_block = "${aws_subnet.subnet_private_2.cidr_block}"
    action     = "allow"
  }

  # Ephermal Port from subnet_private_1
  egress {  
    rule_no    = 300
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${aws_subnet.subnet_private_1.cidr_block}"
    action     = "allow"
  }
  # Ephermal Port from subnet_private_2
  egress {  
    rule_no    = 310
    protocol   = 6
    from_port  = 1024
    to_port    = 65535
    cidr_block = "${aws_subnet.subnet_private_2.cidr_block}"
    action     = "allow"
  }
}

