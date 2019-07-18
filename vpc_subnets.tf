
variable "private_subnet_az1" {
    default = "us-east-1a"
}

variable "private_subnet_cidr_block1" {
    default = "10.11.0.0/20"
}

variable "private_subnet_az2" {
    default = "us-east-1c"
}

variable "private_subnet_cidr_block2" {
    default = "10.11.16.0/20"
}

resource "aws_subnet" "subnet_private_1" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "${var.private_subnet_az1}"
  cidr_block = "${var.private_subnet_cidr_block1}"

  tags = {
    Name = "subnet_private_1"
    Owner = "terraform"
  }
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "${var.private_subnet_az2}"
  cidr_block = "${var.private_subnet_cidr_block2}"

  tags = {
    Name = "subnet_private_2"
    Owner = "terraform"
  }
}