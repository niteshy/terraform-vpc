
variable "private_subnet_az1" {
    default = "us-east-1a"
}
variable "private_subnet_az2" {
    default = "us-east-1c"
}

variable "public_subnet_cidr_block1" {
    default = "10.11.128.0/22"
}
variable "private_subnet_cidr_block1" {
    default = "10.11.0.0/20"
}
variable "private_subnet_cidr_block2" {
    default = "10.11.16.0/20"
}
variable "private_redshift_subnet_cidr_block" {
    default = "10.11.160.0/22"
}

# public-1 subnet
resource "aws_subnet" "subnet_public_1" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "${var.private_subnet_az1}"
  cidr_block = "${var.public_subnet_cidr_block1}"

  tags = {
    Name = "subnet_public_1"
    createdBy = "${var.createdBy}"
  }
}

# private-1 subnet
resource "aws_subnet" "subnet_private_1" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "${var.private_subnet_az1}"
  cidr_block = "${var.private_subnet_cidr_block1}"

  tags = {
    Name = "subnet_private_1"
    createdBy = "${var.createdBy}"
  }
}

# private-2 subnet

resource "aws_subnet" "subnet_private_2" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "${var.private_subnet_az2}"
  cidr_block = "${var.private_subnet_cidr_block2}"

  tags = {
    Name = "subnet_private_2"
    createdBy = "${var.createdBy}"
  }
}

# redshift subnet
resource "aws_subnet" "subnet_private_redshift" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "${var.private_subnet_az1}"
  cidr_block = "${var.private_redshift_subnet_cidr_block}"

  tags = {
    Name = "subnet_private_redshift"
    createdBy = "${var.createdBy}"
  }
}