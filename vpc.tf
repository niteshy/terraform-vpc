
variable "vpc_cidr_block" {
    default = "10.11.0.0/16"
}

resource "aws_vpc" "vpc_main" {
    cidr_block = "${var.vpc_cidr_block}"
    tags = {
        Name = "vpc_main"
        Owner = "terraform"
    }
}
